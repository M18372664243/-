GLOBAL.setmetatable(env, {__index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end})
require("stategraphs/commonstates")
local slotmachineutils = require "modules.slotmachineutils"
--SlotMachine
modimport "lib_ver.lua"
modimport("main/calculateConfig")
modimport("main/chooseLanguage")
--Settings Configurations & Variables（读取配置项）
local diff = TUNING.SLOTMACHINE_MODCONFIGDATA["Difficulty"] --难度
local mob = TUNING.SLOTMACHINE_MODCONFIGDATA["Mob"] --普通怪爆金币
local boss = TUNING.SLOTMACHINE_MODCONFIGDATA["Boss"] --Boss爆金币
local env = TUNING.SLOTMACHINE_MODCONFIGDATA["Environment"] --石头、树、巨大作物爆金币
local IsGiftMachine = TUNING.SLOTMACHINE_MODCONFIGDATA["IsGiftMachine"] --老虎机是否可以开礼物
local start = TUNING.SLOTMACHINE_MODCONFIGDATA["Starting"] --保证初始金币数量为整数，即使填的是小数
local announcements = TUNING.SLOTMACHINE_MODCONFIGDATA["Announcements"] --是否开启老虎机计数公告
local antitrash = TUNING.SLOTMACHINE_MODCONFIGDATA["Antitrash"] --防止老虎机周围物品过多
PrefabFiles = {
	"dubloon",
	"slotmachine",
	"ohshopitem",
}

--Loading Slot machine assets（老虎机的资源文件）
Assets = {
    Asset("SOUNDPACKAGE", "sound/ia.fev"),
    Asset("SOUND", "sound/ia_sfx.fsb"),
	Asset("SOUND", "sound/ia_sfx_lp.fsb"),
    Asset("ATLAS", "images/slotm_inventory.xml"),
    Asset("IMAGE", "images/slotm_inventory.tex"),
	Asset("ATLAS", "images/Slotmachine.xml"),
	Asset("IMAGE", "images/Slotmachine.tex"),
	Asset("ATLAS", "images/dubloons.xml"),
	Asset("IMAGE", "images/dubloons.tex"),
	Asset("ATLAS", "images/ohcoin10.xml"),
	Asset("ATLAS", "images/ohcoinrandom.xml"),
	Asset("IMAGE", "images/ohcoin10.tex"),
	Asset("IMAGE", "images/ohcoinrandom.tex"),
}
AddMinimapAtlas("images/Slotmachine.xml")

PlayerSlotSave = nil --For Wonkey swaps; kind of an ugly solution, but it works


modimport("main/givePlayersInitialItems")
modimport("main/otherrecipes")
modimport("main/dubloonrefinerecipes")
modimport("main/dubloonshoprecipes")
--Function for determining if the code should execute on global or not判断代码是否在主机上执行
local function GlobalCheck(inst)
    if not TheWorld.ismastersim then
       return inst
    end;
end

--Function to make halloween ornaments usable in slot machine 使万圣节饰品在老虎机中可用的功能
AddPrefabPostInitAny(function(inst)
    if inst:HasTag("halloween_ornament") and inst:HasTag("molebait") and inst:HasTag("cattoy") then
       inst:AddComponent("tradable")
    end
end)

AddUserCommand("count", {		-- 添加一个命令，告诉玩家他们的“老虎机摇奖次数”！
	prettyname = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.COUNT_COMMOND_PRETTY_NAME,
	desc = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.COUNT_COMMOND_DESC,
	permission = nil, -- 无需特殊权限，人人都能摇起来！(COMMAND_PERMISSION.MODERATOR的注释可忽略)
	slash = true,
	usermenu = false,
	servermenu = false,
	params = {},
	paramsoptional = {false},
	vote = false,
	serverfn = function(params, caller)
		caller:DoTaskInTime(1,function()
			caller.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.COUNT_COMMOND_SAY1 .. caller.slotrolls .. STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.COUNT_COMMOND_SAY2, 10)
		end)
	end,
})

-------------------------------------------------------------------------------------------------------------------------
if not SERVER_SIDE then
	return
end
--当用户抽奖次数或者抽奖机被抽次数达到下面列表中的值时都会发出公告
rollnum = {10, 50, 100, 200, 500, 1000, 2500, 5000, 10000, 20000, 50000, 100000} -- 哈哈，这些数字看起来就像DST幸存者的每小时摇奖次数一样呢！真的有人能达到100,000次吗？我们来瞧瞧！
local function SlotAnnouncements(user, machine)
	for k, v in ipairs(rollnum) do
		if user.slotrolls == v then
			TheNet:Announce(user.name .. STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.USER_ROLLS .. user.slotrolls .. STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.USER_ACHIEVEMENT)
		end
		if machine.slotrolls == v then
			TheNet:Announce(user.name .. STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.MACHINE_ROLLS .. machine.slotrolls .. STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.MACHINE_ACHIEVEMENT)
		end
	end

	-- 为特定的摇奖次数添加个性化的公告
	local specificAnnouncement = STRINGS.SLOTMACHINE_ANNOUNCE_TEXT["USER_" .. user.slotrolls]
	if specificAnnouncement then
		TheNet:Announce(user.name .. specificAnnouncement)
	end
end

--New utility code: prevent litter at the slot machine! Prevents the players from being able to use slot machines if there are too many items at the slot machine >:(
--新的实用程序代码：防止在老虎机上乱扔垃圾！如果老虎机上的物品太多，则阻止玩家使用老虎机>：（
local old_give_action = ACTIONS.GIVE.fn
local function count_items_around_slotmachine(target)
	local x, y, z = target.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x, y, z, 8, {"_inventoryitem"})
	local count = 0
	for _, v in ipairs(ents) do
		if v.components.inventoryitem.owner == nil then
			count = count + 1
		end
	end
	return count
end

ACTIONS.GIVE.fn = function(act)
	if not act.doer or not act.doer.userid or not act.target or not act.target:HasTag("slotmachine") then
		return old_give_action(act)
	end

	local count = count_items_around_slotmachine(act.target)
	local cangive = count <= 50
	act.target.slotlock = act.target.slotlock and count > 10

	if cangive and (not act.target.slotlock or antitrash == false) then
		if act.target:HasTag("slotmachine") then
			if antitrash then
				act.doer:DoTaskInTime(1, function()
					if count <= 25 and count > 15 then
						act.doer.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.SHOULD_CLEAN_UP)
					elseif count <= 35 and count > 25 then
						act.doer.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.GETTING_MESSY)
					elseif count <= 50 and count > 35 then
						act.doer.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.REALLY_SHOULD_CLEAN)
					end
				end)
			end
			act.doer.slotrolls = act.doer.slotrolls + 1
			act.target.slotrolls = act.target.slotrolls + 1
			if announcements then
				SlotAnnouncements(act.doer, act.target)
			end
		end
		return old_give_action(act)
	elseif act.doer.components.talker then
		act.target.slotlock = true
		act.doer:DoTaskInTime(1, function()
			if count >= 35 then
				act.doer.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.TOO_MANY_ITEMS)
			elseif count > 25 then
				act.doer.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.CAN_DO_BETTER)
			elseif count > 15 then
				act.doer.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.STILL_SOME_TO_CLEAN)
			end
		end)
	end
	return false -- 阻止给予动作，如果老虎机被锁定或条件不满足
end

--Global announcements for certain slot roll quantities, just for funsies lol
--Saving scores/slot machines that are spawned by default as permanent entities!
--某些老虎机卷数量的全球公告，只是为了好玩哈哈
--保存默认情况下衍生为永久实体的分数/老虎机！
local function OnSave(inst,data)
	if inst.OnSaveCasino ~= nil then
		inst.OnSaveCasino(inst,data)
	end
	if inst.permanententity ~= nil then
		data.permanententity = inst.permanententity
	end
	if inst.slotrolls ~= nil then
		data.slotrolls = inst.slotrolls
	end
	if inst.playerslotsave ~= nil then
		data.playerslotsave = inst.playerslotsave		--Used to save player stat values when swapping characters at portal 用于在大门交换角色时保存玩家统计值
	end
end

local function OnLoad(inst,data)
	if inst.OnLoadCasino ~= nil then
		inst.OnLoadCasino(inst,data)
	end
	if data ~= nil and data.permanententity ~= nil then
		inst.permanententity = data.permanententity
	end
	if data ~= nil and data.slotrolls ~= nil then
		inst.slotrolls = data.slotrolls
	end
	if data ~= nil and data.playerslotsave ~= nil then
		inst.playerslotsave = data.playerslotsave
	end
end

local function SlotInspect(inst)	--For slot machine inspecting how many rolls it has :)
	local oldGetDescription = inst.components.inspectable.GetDescription
	inst.components.inspectable.GetDescription = function(self, viewer)
		local desc = oldGetDescription(self, viewer)
		if self.inst.slotrolls ~= nil then
			--desc = desc .. "\n" .. viewer.name .. "'s average wealth: " .. viewer.routinewealth/viewer.wealthchecks .. "\n" .. viewer.name .. "'s current debt: " .. viewer.taxdebt .. "\n Taxable Wealth: " .. viewer.taxablewealth .. "\nTax Estimation: " .. (viewer.taxablewealth * viewer.taxrate)
			desc = desc .. string.format(STRINGS.SLOTMACHINE_OTHER_TEXT.SLOTMACHINE_INSPECT_DESCRIPTION, self.inst.slotrolls)
		end
		return desc
	end
end

--Expiration timers, new!
local function DecayInspect(inst)
	if not TheWorld.ismastersim then
		return
	end
	if inst.components.inspectable ~= nil then
		local oldGetDescription = inst.components.inspectable.GetDescription
		inst.components.inspectable.GetDescription = function(self, viewer)
			local desc = oldGetDescription(self, viewer)
			if self.inst.decaytimer ~= nil and self.inst.decaytimer > 0 then
				desc = desc .. string.format(STRINGS.SLOTMACHINE_OTHER_TEXT.DECAY_DESCRIPTION, self.inst.decaytimer)
			end
			return desc
		end
	end
end

AddPrefabPostInitAny(function(inst)
	inst:DoTaskInTime(0.1, function(inst)
		if inst.decaytimer ~= nil then
			DecayInspect(inst)
		end
	end)
end)

--Support for new decay feature: adding tags to hostile mobs that are missing it for some reason >:(
--支持新的衰减功能：为因某种原因丢失标签的敌对暴徒添加标签>：(
ListOfHostiles = {"mutated_penguin","killerbee","mosquito"}
for k, v in pairs(ListOfHostiles) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("hostile")
    end)
end

AddPrefabPostInit("slotmachine", function(inst)
	if not TheWorld.ismastersim then
		return
	end
	if inst.slotrolls == nil then
		inst.slotrolls = 0
	end

	SlotInspect(inst) --Adding slot machine count inspection
	--[[inst.OnSaveCasino = inst.OnSave		--Caused the weird issues I had before >:( Imported into slotmachine.lua
	inst.OnSave = OnSave
	inst.OnLoadCasino = inst.OnLoad
	inst.OnLoad = OnLoad]]
	inst:DoTaskInTime(0, function(inst)
		if inst.permanententity then
			inst:RemoveComponent("workable")
			inst:RemoveComponent("burnable")
		end
	end)
end)

ListOfPortal = {"multiplayer_portal", "multiplayer_portal_moonrock", "multiplayer_portal_moonrock_constr"}
for k, v in pairs(ListOfPortal) do
	AddPrefabPostInit(v, function(inst)
		if not TheWorld.ismastersim then
			return
		end
		if inst.playerslotsave == nil then
			inst.playerslotsave = {}
		end

		inst.OnSaveCasino = inst.OnSave
		inst.OnSave = OnSave
		inst.OnLoadCasino = inst.OnLoad
		inst.OnLoad = OnLoad
	end)
end

AddPlayerPostInit(function(inst)
	if inst.slotrolls == nil then 	--For counting how many slot machine rolls you make lol (this doesn't discriminate between using potato cups/dubloons or whatever
		inst.slotrolls = 0
	end

	inst.OnSaveCasino = inst.OnSave
	inst.OnSave = OnSave
	inst.OnLoadCasino = inst.OnLoad
	inst.OnLoad = OnLoad

	inst:ListenForEvent("ms_playerreroll", function(inst)		--Enact this when players are swapping their characters with portal!
		print("reroll happening")
		if inst.name ~= nil then
			print(inst.name .. " is rerolling their character")
		end
		--print(inst.userid)	--Doesn't exist, is momentarily wipped during reroll
		local portal = TheSim:FindFirstEntityWithTag("multiplayer_portal")
		PlayerSlotSave = {inst.slotrolls}	--For wonkey swaps
		portal.playerslotsave[inst.userid] = PlayerSlotSave
	end)

	inst:ListenForEvent("ms_playerseamlessswaped", function(inst)	--For WONKEY specifically
		print("seamless player swapping for " .. inst.name)
		inst.slotrolls = PlayerSlotSave[1]
		PlayerSlotSave = nil 	--Clearing the saved data upon swap finishing
	end)
end)

--List of all the mult values used later on; this list is for tuning/testing purposes, as well as anyone who wants to alter values or rebalance c: 以后使用的所有mult值的列表；此列表用于调整/测试目的，以及任何想要更改值或重新平衡c:
MultMobs0 = 0.05 * mob 	--5%
MultMobs1 = 0.2 * mob	--20%
MultMobs2 = 0.5 * mob	--50%
MultMobs3 = 1 * mob		--100%
MultMobs4 = 2 * mob
MultMobs5 = 4 * mob
--MultMobs6 = 8 --unused lol
MultBoss1 = 8 * boss
MultBoss2 = 12 * boss
MultBoss3 = 20 * boss
MultBoss4 = 30 * boss
--MultBoss5 = --unused lol
MultEnv1 = 0.2 * env		--20%
MultEnv2 = 0.4 * env		--40%
MultEnv3 = 0.6 * env		--60%
MultEnv4 = 1 * env		--100%
MultEnv5 = 2 * env
MultEnv6 = 3 * env
--MultEnv7 = --unused lol

--Dubloon dropping function: mult is a value defined for each drop rate that is then multiplied by difficulty (diff)金币掉落函数：mult是为每个掉落率定义的值，然后乘以难度（diff）
local function DubloonDrop(inst)
	if inst.dubchance == nil then
		inst.dubchance = 0	--Failsafe
	end
	int = math.floor(diff*inst.dubchance)
	dec = diff*inst.dubchance - int
	if inst.components.lootdropper ~= nil then
		if int > 0 then --Loop to drop the proper number (int) of dubloons
			for i = 1, int do
				--print("Dropped a dubloon: " .. i .. "x")
				inst.components.lootdropper:AddChanceLoot("dubloon", 1)
			end
		end
		if dec > 0 then --Consolidation of the decimal as a chance drop
			--print("Rolling for a " .. dec*100 .. "% chance for a dubloon")
			inst.components.lootdropper:AddChanceLoot("dubloon", dec)
		end
	end
end

--For special, niche use cases where lootdropper is overwritten (bunnymen)
local function DubloonSpawn(inst)
	if inst.dubchance == nil then
		inst.dubchance = 0	--Failsafe
	end
	int = math.floor(diff*inst.dubchance)
	dec = diff*inst.dubchance - int
	if inst.components.lootdropper ~= nil then
		if int > 0 then --Loop to drop the proper number (int) of dubloons
			for i = 1, int do
				--print("Dropped a dubloon: " .. i .. "x")
				inst.components.lootdropper:SpawnLootPrefab("dubloon")
			end
		end
		--Workaround of the random number finder using math.random
		RanNum = (math.random(0,10000))/10000 -- Generate a random number between 0 and 1 to 4 decimal places (more decimal places possible if wanted)
		if dec > RanNum then --Consolidation of the decimal as a chance drop
			--print("Rolling for a " .. dec*100 .. "% chance for a dubloon")
			inst.components.lootdropper:SpawnLootPrefab("dubloon") -- if dec = 0.75, dec has a 75% chance of being more than RanNum, and a 25% chance of being less than
		end
	end
end

--Custom function for klaus
local function DubloonFling(inst)
	if inst.dubchance == nil then
		inst.dubchance = 0	--Failsafe
	end
	int = math.floor(diff*inst.dubchance)
	dec = diff*inst.dubchance - int
	if inst.components.lootdropper ~= nil then
		if int > 0 then --Loop to drop the proper number (int) of dubloons
			for i = 1, int do
				inst.components.lootdropper:FlingItem(SpawnPrefab("dubloon"))
			end
		end
		--Workaround of the random number finder using math.random
		RanNum = (math.random(0,10000))/10000 -- Generate a random number between 0 and 1 to 4 decimal places (more decimal places possible if wanted)
		if dec > RanNum then
			inst.components.lootdropper:FlingItem(SpawnPrefab("dubloon"))-- if dec = 0.75, dec has a 75% chance of being more than RanNum, and a 25% chance of being less than
		end
	end
end

--Helper for Drop Rate Display function
local function ChanceFormat(chance)
	local droprate = nil
	local int = nil
	local rem = nil
	if chance < 1 then
		if chance*100 - math.floor(chance*100) >= 0.005 then
			droprate = string.format("%.2f", chance * 100) .. "%"
		else
			droprate = math.floor(chance * 100) .. "%"
		end
	else
		int = math.floor(chance)
		rem = (chance - int) * 100
		if rem >= 0.005 then
			if rem - math.floor(rem) >= 0.005 then 		--If the percentage remainder is a messy decimal, use string format
				droprate = int .. "x + " .. string.format("%.2f", rem) .. "%"
			else
				droprate = int .. "x + " .. math.floor(rem) .. "%"
			end
		else
			droprate = int .. "x"
		end
	end
	return droprate
end

--Examining a mob/loot source will show what its blueprint drop chances are!
local function DubloonDropRate(inst)
	if inst.components.inspectable then
		local oldGetDescription = inst.components.inspectable.GetDescription
		if inst.dubchance == nil then
			inst.dubchance = 0	--Failsafe
		end
		local droprate = ChanceFormat(inst.dubchance * diff)
		inst.components.inspectable.GetDescription = function(self, viewer)
			local desc = oldGetDescription(self, viewer)
			desc = desc .. string.format(STRINGS.SLOTMACHINE_OTHER_TEXT.DUBLOON_DROP_RATE, droprate)
			return desc
		end
	end
 end

--Dubloon drop rates:
-- WEAKEST MOB DUBLOON LOOT CHANCE
ListOfMobs0 = {"butterfly","spider","bee","killerbee","bird_mutant","bird_mutant_spitter"}
for k, v in pairs(ListOfMobs0) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
		inst.dubchance = MultMobs0
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

-- WEAK MOB BP LOOT CHANCE
ListOfMobs1 = {"grassgekko","bat","crow","robin","robin_winter","hound","firehound","icehound","catcoon","canary","frog","perd","smallbird","mosquito","snurtle","mole","carrat","squid","little_walrus","lightflier","dustmoth","fruitfly","mutatedhound","mutated_penguin","eyeofterror_mini","ticoon","clayhound","lightcrab","hedgehound","shadow_leech"} --"rabbit",
for k, v in pairs(ListOfMobs1) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
		inst.dubchance = MultMobs1
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

-- NORMAL MOB BP LOOT CHANCE
ListOfMobs2 = {"pigman","spider_warrior","spider_hider","spider_moon","spider_spitter","spider_dropper","spider_water","spider_healer","merm","mermguard","babybeefalo","crawlinghorror","crawlingnightmare","walrus","slurper","buzzard","penguin","cookiecutter","teenbird","monkey","lavae", "molebat","lunarfrog"}
for k, v in pairs(ListOfMobs2) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultMobs2
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

-- STRONG MOB BP LOOT CHANCE
ListOfMobs3 = {"pigguard","worm","beefalo","bishop","bishop_nightmare","knight","knight_nightmare","rook","rook_nightmare","lightninggoat","mossling","slurtle", "waterplant","terrorbeak","nightmarebeak","deer","tentacle","tallbird","krampus","fruitdragon", "oceanhorror", "mushgnome", "archive_centipede","gingerbreadpig","warglet","powder_monkey","lunarthrall_plant","shadowthrall_hands","shadowthrall_wings","shadowthrall_horns","fused_shadeling"}
for k, v in pairs(ListOfMobs3) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultMobs3
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

-- STRONGEST MOB BP LOOT CHANCE
ListOfMobs4 = {"tentacle_pillar","koalefant_summer","koalefant_winter","rocky","spat","grassgator","gnarwail","shark","mermking","prime_mate"}
for k, v in pairs(ListOfMobs4) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultMobs4
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

-------------------- BOSS DUBLOON DROP RATES --------------------------
-- BASIC BOSS BP LOOT CHANCE
ListOfMobs5 = {"warg","leif","leif_sparse","spiderqueen", "lordfruitfly","deer_red","deer_blue","gingerbreadwarg","claywarg"}
for k, v in pairs(ListOfMobs5) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultMobs5
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

-- SEASONAL BOSS DROP - Default Drop of 8 dubloons
ListOfBoss1 = {"deerclops","moose","antilion","bearger","stalker","eyeofterror","mutatedwarg"}
for k, v in pairs(ListOfBoss1) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultBoss1
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

-- SPECIAL ENVIRONMENT BOSS DROP - Default Drop of 12 dubloons
ListOfBoss2 = {"malbatross","minotaur","daywalker","mutateddeerclops","mutatedbearger","sharkboi","daywalker2"}--,"twinofterror1","twinofterror2"}
for k, v in pairs(ListOfBoss2) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultBoss2
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

-- RAID BOSS DROP - Default Drop of 20 dubloons 龙蝇 蜂后 蛤蟆
ListOfBoss3 = {"dragonfly","beequeen","toadstool"}
for k, v in pairs(ListOfBoss3) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultBoss3
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

-- CHALLENGE RAID BOSS DROP - Default Drop of 30 dubloons 悲惨蛤蟆 帝王蟹 被击败的天体
ListOfBoss4 = {"toadstool_dark","crabking","alterguardian_phase3dead"}
for k, v in pairs(ListOfBoss4) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultBoss4
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end


--针对天体
local function Alterguardian_phaseDubloonDropRate(inst)
	local oldGetDescription = inst.components.inspectable.GetDescription
	inst.dubchance = 0
	if inst.origion and inst.origion == 'slotmachine' then
		inst.dubchance = MultBoss1
	else
		inst.dubchance = MultBoss4
	end
	local droprate = ChanceFormat(inst.dubchance * diff)
	inst.components.inspectable.GetDescription = function(self, viewer)
		local desc = oldGetDescription(self, viewer)
		desc = desc .. string.format(STRINGS.SLOTMACHINE_OTHER_TEXT.DUBLOON_DROP_RATE, droprate)
		return desc
	end
 end
--针对天体
 local function Alterguardian_phaseDubloonDrop(inst)
	inst.dubchance = 0
	if inst.origion and inst.origion == 'slotmachine' then
		inst.dubchance = MultBoss1
		local int = math.floor(diff*inst.dubchance)
		local dec = diff*inst.dubchance - int
		if inst.components.lootdropper ~= nil then
			if int > 0 then
				for i = 1, int do
					inst.components.lootdropper:AddChanceLoot("dubloon", 1)
				end
			end
			if dec > 0 then
				inst.components.lootdropper:AddChanceLoot("dubloon", dec)
			end
		end
	end
end

--Celestial Champion (Also disabling its dropping function on the 3 phases lol 天体三阶段
ListOfPhase = {"alterguardian_phase1","alterguardian_phase2","alterguardian_phase3"}
for k, v in pairs(ListOfPhase) do
	AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
		inst.dubchance = MultBoss4
		inst:DoTaskInTime(0, Alterguardian_phaseDubloonDropRate)
		inst:DoTaskInTime(0, Alterguardian_phaseDubloonDrop)
	end)
end

-----------------------------------------------Special Mobs/Drop Rate Codes:---------------------------------------------------------
--Poison Birchnut Trees 桦树精
 local DeciduousPoison = function(self)
     local startmonster=self.StartMonster
     local StartMonster2=function(self,starttime)
        if startmonster then startmonster(self,starttime) end
		self.inst:AddTag("vanilla_entityDB")
		self.inst.dubchance = MultMobs4
		self.inst:DoTaskInTime(0, DubloonDropRate)
		self.inst:DoTaskInTime(0, DubloonDrop)
     end
     self.StartMonster=StartMonster2
 end
 AddComponentPostInit("deciduoustreeupdater", DeciduousPoison)

--Werepigs--
local WerepigDropper = function(inst)
    local IsWerepig = inst.components.werebeast
    if IsWerepig then
        local onsetwerefn = IsWerepig.onsetwerefn
        local SetWerePig2 = function(inst)
            if onsetwerefn then
				onsetwerefn(inst)
			end
            if inst:HasTag("werepig") and not inst:HasTag("moonbeast") then
				inst.dubchance = MultMobs3
				inst:AddTag("vanilla_entityDB")
				--inst:DoTaskInTime(0, DubloonDropRate)	(Since the first function already runs this)
				inst:DoTaskInTime(0, DubloonDrop)
            end
        end
        IsWerepig:SetOnWereFn(SetWerePig2)
    end
end
-- 猪人
AddPrefabPostInit("pigman",WerepigDropper)

--Bunnymen/rabbits (since their alt state erases the drop table, which means AddChanceLoot will not work) 兔人
AddPrefabPostInit("bunnyman", function(inst)
	inst:AddTag("vanilla_entityDB")
	inst.dubchance = MultMobs2
	inst:DoTaskInTime(0, DubloonDropRate)
	inst:ListenForEvent("death", DubloonSpawn)
end)
-- 兔子
AddPrefabPostInit("rabbit", function(inst)
	local function BeardDubloon(inst)
		DubloonSpawn(inst) --, MultMobs1)
	end
	inst:AddTag("vanilla_entityDB")
	inst.dubchance = MultMobs1
	inst:DoTaskInTime(0, DubloonDropRate)
	inst:ListenForEvent("death", BeardDubloon)
end)

--Twins of Terror (because their "on both kill" drop replaces all other lootdroppers >:(  双子魔眼
ListOfTwins = {"twinofterror1","twinofterror2"}
for k, v in pairs(ListOfTwins) do
	AddPrefabPostInit(v, function(inst)
		inst:AddTag("vanilla_entityDB")
		inst.dubchance = MultBoss2
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:ListenForEvent("death", DubloonSpawn)
	end)
end

---------------------BOSS SPECIAL CODE-------------------------
--Klaus
AddPrefabPostInit("klaus_sack", function(inst) --- thanks to tshaw for simplified, more stable code, Default Drop = 20
	GlobalCheck(inst)
    if inst.components.klaussacklock then
        local old_onuseklauskey = inst.components.klaussacklock.onusekeyfn
        inst.components.klaussacklock:SetOnUseKey(function(inst, key, doer)
            if key.components.klaussackkey.truekey then
				inst:AddTag("vanilla_entityDB")
				inst.dubchance = MultBoss3
				inst:DoTaskInTime(0, DubloonDropRate)
				inst:DoTaskInTime(0, DubloonFling)--Custom function for klaus
            end
            return old_onuseklauskey(inst, key, doer)
        end)
    end
end)

--Shadow Chess Pieces 暗影三基佬
ListOfShadowPieces = {"shadow_knight","shadow_bishop","shadow_rook"}
for k, v in pairs(ListOfShadowPieces) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
        if inst.components.lootdropper then
            local old_lootsetupfn = inst.components.lootdropper.lootsetupfn
			inst.components.lootdropper:SetLootSetupFn(function(lootdropper)
				old_lootsetupfn(lootdropper)
				if lootdropper.inst.level <= 1 then
					inst.dubchance = MultMobs3 --1 dubloon by default
				end
				if lootdropper.inst.level >= 2 then
					inst.dubchance = MultMobs5 --4 dubloons by default
				end
				if lootdropper.inst.level >= 3 then
					inst.dubchance = MultBoss2 --12 dubloons by default, double the normal boss value (20-4 = 16)
				end
				inst:AddTag("vanilla_entityDB")
				inst:DoTaskInTime(0, DubloonDropRate)
				DubloonDrop(inst)
			end)
        end
    end)
end

--Ancient Fuelweaver 织影者
AddPrefabPostInit("stalker_atrium", function(inst)
	GlobalCheck(inst)
    if inst.components.lootdropper then
        local old_lootsetupfn = inst.components.lootdropper.lootsetupfn
        inst.components.lootdropper:SetLootSetupFn(function(lootdropper)
            old_lootsetupfn(lootdropper)
            if not lootdropper.inst.atriumdecay then
				inst.dubchance = MultBoss3 --20 dubloons by default
				inst:AddTag("vanilla_entityDB")
				inst:DoTaskInTime(0, DubloonDropRate)
				DubloonDrop(inst)
            end
        end)
    end
end)

--Environmental drop rates, revamped!
--Universal environmental code (For all choppables, mineables, stump digging!)
local function DubloonWork(inst)	--meant to be called with inst.dubchance already assigned, if it's not we have a PROBLEM
	inst:ListenForEvent("worked", function(inst)
		local instwork = inst.components.workable
		local instgrow = inst.components.growable
		if instwork and instwork.workleft ~= nil and instwork.workleft <= 0 then --The final work event to destroy the prefab!
			if instwork.action == ACTIONS.CHOP and inst:HasTag("tree") and not inst:HasTag("stump") then
				if instgrow and instgrow.stage < 4 then --For trees/choppables only, no burnt or old trees (Excluding stumps)
					inst.dubchance = inst.dubchance * (inst.components.growable.stage)/2
				elseif (instgrow and instgrow == 4) or inst:HasTag("burnt") then 	--Stage 4 trees (withered) or burnt trees
					inst.dubchance = inst.dubchance / 10
				end
				--print("chopping")
			elseif instwork.action == ACTIONS.DIG then	--For diggables, only stumps for now (maybe grave mounds/weeds can have their own) and inst:HasTag("stump")
				--print("shoveling")
			elseif instwork.action == ACTIONS.MINE and inst.originalwork ~= nil and not inst:HasTag("stump") then --For mineables only!
				if inst.originalwork == nil then 	--Default values if unassigned; assumes that it is the lowest possible state
					inst.originalwork = 2
				end
				inst.dubchance = inst.dubchance * (inst.originalwork/6)
				--print("mining")
			end
			DubloonSpawn(inst)
		end
	end)
end

--Only records the initial "work left" values on the targets! Not the best way to do this, but it's a way I know that works. Added benefit of only applying when a player is chopping (prevents bearger, other farms)
local old_chop_action = ACTIONS.CHOP.fn		--Technically obselete, but keeping it here for legacy use
ACTIONS.CHOP.fn = function(act)
	if act.doer and act.target and act.target.originalwork == nil then
		act.target.originalwork = act.target.components.workable.workleft
	end
	return old_chop_action(act)
end

local old_mine_action = ACTIONS.MINE.fn
ACTIONS.MINE.fn = function(act)
	if act.doer and act.target and act.target.originalwork == nil then
		act.target.originalwork = act.target.components.workable.workleft
	end
	return old_mine_action(act)
end

--Examining a mob/loot source will show what its dubloon drop chances are!
local function TreeDropRateDB(inst)
	if inst.components.inspectable then
		local oldGetDescription = inst.components.inspectable.GetDescription
		inst.components.inspectable.GetDescription = function(self, viewer)
			local desc = oldGetDescription(self, viewer)
			local chance = inst.dubchance
			if inst.components.growable and inst.components.growable.stage < 4 and not inst:HasTag("stump") then
				chance = inst.dubchance * inst.components.growable.stage/2
			elseif ((inst.components.growable and inst.components.growable.stage == 4) or inst:HasTag("burnt")) and not inst:HasTag("stump") then
				chance = inst.dubchance / 10
			elseif chance == nil then
				chance = 0
				print(inst.prefab .. " has unassigned dubloon drop chance!")
			end
			local droprate = ChanceFormat(chance * diff)
			desc = desc .. string.format(STRINGS.SLOTMACHINE_OTHER_TEXT.DUBLOON_DROP_RATE, droprate)
			--inst:PushEvent("examinetree")
			return desc
		end
	end
 end

 local function TreeInspectUnload(inst)
 	inst:DoPeriodicTask(0.5, function(inst)
		if inst.entity:IsAwake() == false and inst.isexaminedC ~= nil then
			inst.isexaminedC = nil
		end
	end)
end

--Code for showing tree drop rates because trees are dumb >:( (This code can be used for any other stubborn prefabs that have overwritten examination quotes on load, like trees with growth phases do I think)
local old_lookat_action = ACTIONS.LOOKAT.fn
ACTIONS.LOOKAT.fn = function(act)
	local targ = act.target or act.invobject --This should work I think
	if targ ~= nil then --6.28更新报错处理
		local actwork = targ.components.workable
		if act.doer and targ and targ:HasTag("tree") and not targ:HasTag("leif") and targ.isexaminedC == nil and targ.monster ~= true and actwork and (actwork.action == ACTIONS.CHOP or actwork.action == ACTIONS.MINE or (actwork.action == ACTIONS.DIG and targ:HasTag("stump"))) then	--and not targ:HasTag("stump")
			TreeDropRateDB(targ)
			targ.isexaminedC = true
		end
	end
	return old_lookat_action(act)
end

--Tree cutting for dubloons!
--Common tree drop rates
ListOfTrees1 = {"evergreen","evergreen_sparse","marsh_tree","mushtree_small","mushtree_medium","mushtree_tall","deciduoustree","twiggytree","mushroomsprout"} --,"evergreen_stump","evergreen_sparse_stump","moon_tree_stump"}
for k, v in pairs(ListOfTrees1) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv1 * 0.5
		TreeInspectUnload(inst) --inst:DoTaskInTime(1, TreeDropRateDB) Replaced with LOOKAT + Unload
		DubloonWork(inst)
    end)
end

--Rare tree drop rates
ListOfTrees2 = {"livingtree","livingtree_halloween","moon_tree","driftwood_tree","driftwood_small1","driftwood_small2","driftwood_tall","mushtree_moon","palmconetree"}
for k, v in pairs(ListOfTrees2) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv2 * 0.5
		TreeInspectUnload(inst) --inst:DoTaskInTime(1, TreeDropRateDB) Replaced with LOOKAT + Unload
		DubloonWork(inst)
    end)
end

--Rare tree drop rates
ListOfTrees3 = {"mushtree_tall_webbed","oceantree","cave_banana_tree","cave_banana_stump"}
for k, v in pairs(ListOfTrees3) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		if not inst:HasTag("tree") then --For cave banana trees specifically
			inst:AddTag("tree")
		end
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv3		--Double the other trees, since they're dangerous or cannot be dug!
		TreeInspectUnload(inst) --inst:DoTaskInTime(1, TreeDropRateDB) Replaced with LOOKAT + Unload
		DubloonWork(inst)
    end)
end

--Mining also gives dubloons!
--Common boulders/mineables
ListOfRocks1 = {"rock1","rock2","rock_ice","rock_flintless","rock_moon","cave_entrance","rock_moon_shell","cavein_boulder","stalagmite","stalagmite_tall","stalagmite_full","stalagmite_med","stalagmite_low","stalagmite_tall_full","stalagmite_tall_med","stalagmite_tall_low","seastack","saltstack","rock_petrified_tree","marbleshrub"}
for k, v in pairs(ListOfRocks1) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv1
		inst:DoTaskInTime(0, DubloonDropRate)
		DubloonWork(inst)
    end)
end

--Rare mineables/harder to mine
ListOfRocks2 = {"marbletree","marblepillar","statue_marble","statue_marble_muse","statue_glommer","statueharp","statuemaxwell","sculpture_rookbody","sculpture_bishopbody","sculpture_knightbody","moonstorm_glass","moonglass_rock"}--
for k, v in pairs(ListOfRocks2) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv2
		inst:DoTaskInTime(0, DubloonDropRate)
		DubloonWork(inst)
    end)
end

--Rarest mineables/harder to mine
ListOfRocks3 = {"ruins_statue_mage","ruins_statue_mage_nogem","ruins_statue_head","ruins_statue_head_nogem","grotto_waterfall_small","grotto_waterfall_small1","grotto_waterfall_small2","archive_moon_statue"}
for k, v in pairs(ListOfRocks3) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv3
		inst:DoTaskInTime(0, DubloonDropRate)
		DubloonWork(inst)
    end)
end

--Rarest mineables/hardest to mine
ListOfRocks4 = {"moonglass_stalactite","moon_altar_rock_glass","moon_altar_rock_seed","moon_altar_rock_idol"}
for k, v in pairs(ListOfRocks4) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv4
		inst:DoTaskInTime(0, DubloonDropRate)
		DubloonWork(inst)
    end)
end

--To prevent that annoying issue of it dropping infinite amounts lol
AddPrefabPostInit("daywalker_pillar", function(inst)
	GlobalCheck(inst)
	inst:AddTag("vanilla_entityDB")
	inst.dubchance = 0
	--inst:DoTaskInTime(0, DubloonDropRate)
	--DubloonWork(inst)
end)

--Hammering things unsurprisingly drops dubloons too! (These do not have the universal "work" function, since conflicts with (most) player made structures!)
--Common/easy hammerables
ListOfHammer = {"houndbone","pighead","mermhead","ruins_table","ruins_chair","ruins_vase","ruins_plate","ruins_bowl","ruins_chipbowl","ruins_rubble_vase","ruins_rubble_table","ruins_rubble_chair"}--
for k, v in pairs(ListOfHammer) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv1
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

--Rare hammerables
ListOfHammer2 = {"chessjunk1","chessjunk2","chessjunk3","dead_sea_bones","monkeyisland_portal_debris"}--
for k, v in pairs(ListOfHammer2) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv2
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

ListOfHammer3 = {"ancient_altar","ancient_altar_broken"}--
for k, v in pairs(ListOfHammer3) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv4
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

ListOfHammer4 = {"ancient_altar","ancient_altar_broken","wagstaff_machinery"}	--That's all for now c,:
for k, v in pairs(ListOfHammer4) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv5
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

--New diggables drop rates!
ListOfDig = {"farm_soil_debris","weed_forgetmelots","weed_firenettle","weed_tillweed","weed_ivy"}
for k, v in pairs(ListOfDig) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv1 * 0.5 --10%, these are really easy tbh
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonWork)
    end)
end

ListOfDig2 = {"mound"}
for k, v in pairs(ListOfDig2) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv2
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonWork)
    end)
end

--Growing large crops also lets you get dubloons! We like productivity in game around here
ListOfCrops = {"carrot_oversized","corn_oversized","potato_oversized","tomato_oversized","asparagus_oversized","eggplant_oversized","pumpkin_oversized","watermelon_oversized","dragonfruit_oversized","durian_oversized","garlic_oversized","onion_oversized","pepper_oversized","pomegranate_oversized"}
for k, v in pairs(ListOfCrops) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv2
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

--Mob dens, homes, nests of all sorts: ranked by ease of beating all the mobs inside, the rarity of the entity and renewability
--Abundant/easy (renewable)
ListOfDens = {"molehill"}
for k, v in pairs(ListOfDens) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv2		--2, was formerly 1
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

--Common/normal dens (renewable)
ListOfDens2 = {"beebox","pighouse","rabbithouse","mermhouse_crafted","mermhouse","oceanvine_cocoon","mermwatchtower","monkeybarrel","catcoonden","gingerbreadhouse"}
for k, v in pairs(ListOfDens2) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv4		--4, was formerly 2
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

--Special code for spider dens because they're >:(
AddPrefabPostInit("spiderden", function(inst)
	GlobalCheck(inst)
	inst:AddTag("vanilla_entityDB")
	inst.dubchance = MultEnv4		--4, was formerly 2
	inst:DoTaskInTime(0, DubloonDropRate)
	inst:ListenForEvent("death", DubloonSpawn)
end)

--Rare/hard dens, nonrenewable or difficult
ListOfDens3 = {"rabbithole","beehive","houndmound","wasphive","wobster_den"}
for k, v in pairs(ListOfDens3) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv5		--5, was formerly 4
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

--Valuable/very hard dens/very scarce, nonrenewable
ListOfDens4 = {"spiderhole","slurtlehole","pigtorch","moonspiderden","moonglass_wobster_den","monkeyhut"}
for k, v in pairs(ListOfDens4) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv6
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
    end)
end

--Fishing now works! I had to assign it to the inventory/item version of fish c,:
ListOfFish = {"pondfish","pondeel","wobster_sheller_land","oceanfish_small_1_inv","oceanfish_small_2_inv","oceanfish_small_3_inv","oceanfish_small_4_inv","oceanfish_small_5_inv","oceanfish_small_6_inv","oceanfish_small_7_inv","oceanfish_small_9_inv"}
for k, v in pairs(ListOfFish) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv2
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
		inst:ListenForEvent("perished", DubloonSpawn)	--Because fish are so FUCKING special
    end)
end

ListOfFish2 = {"wobster_moonglass_land","oceanfish_medium_1_inv","oceanfish_medium_2_inv","oceanfish_medium_3_inv","oceanfish_medium_4_inv","oceanfish_medium_5_inv","oceanfish_medium_6_inv","oceanfish_medium_7_inv","oceanfish_medium_9_inv"}
for k, v in pairs(ListOfFish2) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv3
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
		inst:ListenForEvent("perished", DubloonSpawn)	--Because fish are so FUCKING special
    end)
end

ListOfFish3 = {"oceanfish_small_8_inv","oceanfish_medium_8_inv"}
for k, v in pairs(ListOfFish3) do
    AddPrefabPostInit(v, function(inst)
		GlobalCheck(inst)
		inst:AddTag("vanilla_entityDB")
        inst.dubchance = MultEnv4
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
		inst:ListenForEvent("perished", DubloonSpawn)	--Because fish are so FUCKING special
    end)
end

--Code for "universal" dubloon dropping; for modded mobs not covered in the above tables, to allow using mod with Island Adventures, Uncompromising Mode, any game modes with modded mobs
local function UniversalDropRate(inst) --Setting up drop rate assignment function for modded/mobs not covered
	--Declaring variables for calculating relative modded mob difficulty / explanation of their values
	local mobhealth = nil	--Based on mob HP; flat linear quantity, guaranteed for each mob
	local mobdamage = nil	--Based on damage; flat linear quantity, if mob is passive then = 5 
	local mobperiod = nil	--Based on attack period; scalar multiplier that increases with smaller values
	local mobrange = nil	--Based on mob's attack range; scalar multiplier that increases with larger values
	local mobspeed = nil	--Based on mob's approximate speed; nonlinear scalar that increases logarithmicly in piecewise function
	local speedcalc = nil	--Calculation for the 2 part nature of mob speed (whether slower/faster than player)
	local mobsanity = nil	--Based on mob's insanity aura; linear multiplier that increases incrementally
	local mobhostile = nil	--Flat multiplier bonus for if mob is hostile or not 
	local mobaoe = nil 		--Flat multiplier bonus for if mob has AOE damage or not 
	local mobdiff = nil 	--Variable for the calculation of relative mob difficulty from general stats; formula below

	--Limit variables for later use (separated for easy tuning/adjustment)
	Limit1 = 10
	Limit2 = 50
	Limit3 = 200
	Limit4 = 800
	Limit5 = 3000
	Limit6 = 10000
	Limit7 = 30000
	Limit8 = 80000
	Limit9 = 250000
	Limit10 = 500000

	if inst.components.lootdropper ~= nil and inst.components.health and not (inst:HasTag("vanilla_entityDB") or inst:HasTag("modded_entityDB")) and not inst:HasTag("wall") and not inst:HasTag("balloon") and not inst:HasTag("smashable") and not inst:HasTag("player") and not inst:HasTag("structure") and not inst:HasTag("eyeturret") then --Excluding walls/fence, Wes balloons, ruins smashables, items already assigned drop rates 除了墙壁/围栏、维斯气球、废墟碎片、已分配掉落率的物品
		--Assigning stat values as variables for later use
		local insthealth = inst.components.health
		local instcombat = inst.components.combat
		local instloco = inst.components.locomotor
		local instsanity = inst.components.sanityaura
		--Mob max HP
		if insthealth ~= nil and insthealth.maxhealth > 20 then
			mobhealth = insthealth.maxhealth
		else
			mobhealth = 20	--Minimum health is 20, for calculation purposes
		end
		--Mob damage
		--If mob is passive/doesn't fight back, default damage of 5 is used
		if instcombat ~= nil and instcombat.defaultdamage ~= nil and instcombat.defaultdamage > 5 and instcombat.playerdamagepercent == nil then
			mobdamage = instcombat.defaultdamage
		elseif instcombat ~= nil and instcombat.defaultdamage ~= nil and instcombat.defaultdamage > 5 and instcombat.playerdamagepercent then
			mobdamage = instcombat.defaultdamage * instcombat.playerdamagepercent --Adjusting if player taken damage is different
		--elseif instcombat ~= nil and (instcombat.defaultdamage == nil or instcombat.defaultdamage <= 5) then
		--	mobdamage = 5		--Minimum damage is 5
		else --Keep it simple, if it doesnt fit the above it must be passive/very weak damage
			mobdamage = 5
		end
		--Mob attack period
		if instcombat ~= nil  and instcombat.min_attack_period ~= nil and type(instcombat.min_attack_period) ~= "table" then
			mobperiod = instcombat.min_attack_period
		else
			mobperiod = 4		--If no attack period, assumed to be 4
		end
		--Mob attack range
		if instcombat ~= nil and instcombat.attackrange ~= nil then
			mobrange = instcombat.attackrange
		else
			mobrange = 3		--If no attack range, assumed to be 3 by default
		end
		--Mob speed, has special logic to determine the max speed of a mob
		if instloco ~= nil and instloco.walkspeed ~= nil and instloco.runspeed ~= nil then
			if instloco.runspeed <= 6 then --Default speed that is inaccurate and typically unused (same as player speed)
				mobspeed = instloco.walkspeed --If the mob's max run speed is equal or lower than the player's speed, then we default to their walk speed. They couldn't be that that hard to catch, plus many mobs have a default 6 from locomotor's code
			else --If runspeed is higher than player's runspeed, then we average them out weighing in favor of runspeed if they have both a walk and run speed.
				mobspeed = (instloco.walkspeed + instloco.runspeed*2)/3
			end
		elseif instloco ~= nil and instloco.walkspeed ~= nil then
			mobspeed = instloco.walkspeed
		elseif instloco ~= nil and instloco.runspeed ~= nil then
			mobspeed = instloco.runspeed
		end
		if instloco == nil or mobspeed == nil or mobspeed < 1 then		--Special consideration if mob is very, very slow, or immobile
			mobspeed = 1
		end
		--Mob insanity aura (sign is flipped, since the values in game used are negative for insanity)
		if instsanity ~= nil and instsanity.aura ~= nil and instsanity.aura ~= 0 then
			mobsanity = instsanity.aura * (-60)
		elseif instsanity ~= nil and instsanity.aura == 0 and instsanity.aurafn ~= nil then
			mobsanity = 50
		else
			mobsanity = 0
		end
		--Mob hostility bonus
		if inst:HasTag("monster") or inst:HasTag("hostile") then 	--Hostile mobs get a small bonus multiplier, as aggressive mobs inherently are more dangerous
			mobhostile = 1.20
		else
			mobhostile = 1
		end
		--Mob AOE bonus
		if instcombat ~= nil and instcombat.areahitrange ~= nil then -- Bonus for if mob has AOE damage
			mobaoe = 1.35
		else
			mobaoe = 1
		end

		--Calculation of relative mob difficulty
		if mobspeed < 5 then  -- Special two part function that differs on whether the mob is slower or faster than the default player
			speedcalc = (mobspeed/5)^0.5 --The slower the mob, the worse the debuff/lower the multiplier is
		else
			speedcalc = 1 + ((mobspeed-5)/5)^0.5 --Large bonus if same speed/faster than player, but marginally decreases quickly
		end

		mobdiff = (mobhealth/100) * (mobdamage) * (4/mobperiod) * (mobrange/3) * speedcalc * (1+mobsanity/200) * mobhostile * mobaoe

		--print(inst:GetDisplayName())
		--print("mobdiff = " .. mobdiff)
		--print("mobhealth = " .. mobhealth)
		--print("mobdamage = " .. mobdamage)
		--print("mobperiod = " .. mobperiod)
		--print("mobrange = " .. mobrange)
		--print("mobspeed = " .. mobspeed)
		--print("speedcalc = " .. speedcalc)
		--print("mobsanity = " .. mobsanity)
		--print("mobhostile = " .. mobhostile)
		--print("mobaoe = " .. mobaoe)
		if mobdiff > 0 and mobdiff < Limit1 then 			--0-10
			inst.dubchance = MultMobs0
		elseif mobdiff >= Limit1 and mobdiff < Limit2 then	--10-50
			inst.dubchance = MultMobs1
		elseif mobdiff >= Limit2 and mobdiff < Limit3 then	--50-200
			inst.dubchance = MultMobs2
		elseif mobdiff >= Limit3 and mobdiff < Limit4 then	--200-800
			inst.dubchance = MultMobs3
		elseif mobdiff >= Limit4 and mobdiff < Limit5 then	--800-3000
			inst.dubchance = MultMobs4
		elseif mobdiff >= Limit5 and mobdiff < Limit6 then	--3000-10000
			inst.dubchance = MultMobs5
		elseif mobdiff >= Limit6 and mobdiff < Limit7 then	--10000-30000
			inst.dubchance = MultBoss1
		elseif mobdiff >= Limit7 and mobdiff < Limit8 then	--30000-80000
			inst.dubchance = MultBoss2
		elseif mobdiff >= Limit8 and mobdiff < Limit9 then	--80000-250000
			inst.dubchance = MultBoss3
		elseif mobdiff >= Limit9 then						--250000+
			inst.dubchance = MultBoss4
		end
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
		inst:AddTag("modded_entityDB")
	end
end

AddPrefabPostInitAny(UniversalDropRate)	--Applying this universal mod drop rate code to any and all mobs! 将这个通用的金币掉落代码应用与所有物品

--List of base game items specifically to be excluded from dropping dubloons:
--Diggables: mini sign, crop plants themselves, all plantables (to avoid people planting plants and digging them) (or maybe control this with a stump tag?)
-- Maybe do a white list for diggables, the list of unwanted digs for these goes on so so long (white list = grave mounds, poison holes, weeds/detritus, etc)
--Choppables: Cawnival (Already doesn't work)
--Mineables: maybe stone fruit? (Already doesn't work)
AddPrefabPostInitAny(function(inst)
	local instwork = inst.components.workable
	if inst.components.lootdropper ~= nil and instwork and ((instwork.action == ACTIONS.CHOP and inst:HasTag("tree")) or instwork.action == ACTIONS.MINE or (instwork.action == ACTIONS.DIG and inst:HasTag("stump")))
	and not (inst:HasTag("vanilla_entityDB") or inst:HasTag("modded_entityDB")) and not inst:HasTag("smashable") and not inst:HasTag("structure") then --Excluding ruins smashables, structures (maybe recipes? nah)
		if instwork.action == ACTIONS.CHOP then
			inst.dubchance = MultEnv1 * 0.5
			TreeInspectUnload(inst)	--inst:DoTaskInTime(1, TreeDropRateDB)	-- Replaced with LOOKAT + Unload code
		else
			inst.dubchance = MultEnv1
			inst:DoTaskInTime(0, DubloonDropRate)
		end
		DubloonWork(inst)	--Unfortunately, all modded trees are assumed to be pretty common (if it's a modded game mode, after all) so we default to this. The rarities / spawn rates are what drive whether it should give more, after all since this accounts for amount of time it takes to chop
	end
end)

--Modded Mob special codes (for balancing sake, as the next code block does cover all modded mobs)
if TUNING.SLOTMACHINE_MODCONFIGDATA["workshop-1467214795".."_enable"] then
	--Special support for crabbits, since they also have the alt lootdropper bearded state issue 
	AddPrefabPostInit("crab", function(inst)
		inst:AddTag("modded_entityDB")
		inst.dubchance = MultMobs1
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:ListenForEvent("death", DubloonSpawn)
	end)

	--Crocodog rebalance, since it wouldn't drop dubloons without this
	ListOfCrocodog = {"crocodog","poisoncrocodog","watercrocodog"}
	for k, v in pairs(ListOfCrocodog) do
		AddPrefabPostInit(v, function(inst)
			GlobalCheck(inst)
			inst:AddTag("modded_entityDB")
			inst.dubchance = MultMobs1
			inst:DoTaskInTime(0, DubloonDropRate)
			inst:DoTaskInTime(0, DubloonDrop)
		end)
	end

	--Dragoons, since in the universal code they would receive a 200% drop rate vs 100%
	AddPrefabPostInit("dragoon", function(inst)
		GlobalCheck(inst)
		inst:AddTag("modded_entityDB")
		inst.dubchance = MultMobs3
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
	end)

	--Whale drops (only for displaying drop rates)
	ListOfWhales = {"whale_blue","whale_white"}
	for k, v in pairs(ListOfWhales) do
		AddPrefabPostInit(v, function(inst)
			GlobalCheck(inst)
			inst:AddTag("modded_entityDB")
			inst.dubchance = MultMobs5
			inst:DoTaskInTime(0, DubloonDropRate)
			--inst:DoTaskInTime(0, DubloonDrop)
		end)
	end

	--Whale Carcasses (since these do not work normally, they have carcasses	
	ListOfWhaleCarcass = {"whale_carcass_blue","whale_carcass_white"}
	for k, v in pairs(ListOfWhaleCarcass) do
		AddPrefabPostInit(v, function(inst)
			GlobalCheck(inst)
			inst:AddTag("modded_entityDB")
			inst.dubchance = MultMobs5
			inst:DoTaskInTime(0, DubloonDropRate)
			inst:DoTaskInTime(0, DubloonDrop)
		end)
	end

	--Poison Holes
	AddPrefabPostInit("poisonhole", function(inst)
		GlobalCheck(inst)
		inst:AddTag("modded_entityDB")
		inst.dubchance = MultEnv1
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
	end)

	--Obsidian Boulders (High value lol)
	AddPrefabPostInit("rock_obsidian", function(inst)
		GlobalCheck(inst)
		inst:AddTag("modded_entityDB")
		inst.dubchance = MultEnv3
		inst:DoTaskInTime(0, DubloonDropRate)
		inst:DoTaskInTime(0, DubloonDrop)
	end)

	ListOfIADig = {"magmarock","magmarock_gold"}
	for k, v in pairs(ListOfIADig) do
		AddPrefabPostInit(v, function(inst)
			GlobalCheck(inst)
			inst:AddTag("modded_entityDB")
			inst.dubchance = MultEnv1
			inst:DoTaskInTime(0, DubloonDropRate)
			inst:DoTaskInTime(0, DubloonWork)
		end)
	end

	--Living Jungle Trees
	AddPrefabPostInit("livingjungletree", function(inst)
		GlobalCheck(inst)
		inst:AddTag("modded_entityDB")
		inst.dubchance = MultEnv2 * 0.5
		TreeDropRateDB(inst)
		DubloonWork(inst)
	end)

	--Disabled for now, as it doesn't work properly with DubloonSpawn 
	--[[--That's right, modded IA environmental drop support! This is specifically for "hackable" actions with Machetes, which do not exist in the base game (so they're in this block) 
	local function DubloonHack(inst, input_mult)
		inst:ListenForEvent("worked", function(inst)
			local insthack= inst.components.hackable
			local instwork = inst.components.workable
			if insthack.hacksleft ~= nil and insthack.hacksleft <= 0 then 
				if insthack and inst.originalwork ~= nil then --For hackables only (like bamboo and vines)
					inst.dubchance = input_mult * (inst.originalwork/6)
					DubloonSpawn(inst, mult)
					--print("hacking")
				end
			end
		end)
	end
	
	--Only records the initial "work left" values on the targets! Not the best way to do this, but it's a way I know that works. Added benefit of only applying when a player is chopping (prevents bearger, other farms)
	local old_hack_action = ACTIONS.HACK.fn
	ACTIONS.HACK.fn = function(act)
		if act.doer and act.target and act.target.originalwork == nil then
			act.target.originalwork = act.target.components.hackable.hacksleft
		end
		print(act.target.originalwork)
		return old_hack_action(act)
	end
	
	ListOfHackable = {"bush_vine","bambootree"}
	for k, v in pairs(ListOfHackable) do 
		AddPrefabPostInit(v, function(inst)
			GlobalCheck(inst)
			inst:AddTag("vanilla_entityDB")
			inst.dubchance = MultEnv1
			DubloonHack(inst, mult)
		end)
	end]]

end
-------------------------------------End of drop tables-------------------------------------

-- Spawning of slot machine at selected point 老虎机在指定地点生成
local function SafeSpawnPrefab(prefab,x,y,obj,clear_area)
	if obj ~= nil then
		local x1,y1,z1
		if obj.x ~= nil and obj.y ~= nil then
			x1,z1 = obj.x, obj.z
		else
			x1,y1,z1 = obj.Transform:GetWorldPosition()
		end
		x = x + x1
		y = y + z1
	end
	local tile = w.Map:GetTileAtPoint( x, 0, y )
	--if tile == 1 --_G.GROUND.IMPASSABLE
	--	or tile == 255 --Dark fog
	--then
	--	--print("Can't spawn "..tostring(prefab).." because of water tile.")
	--	return --water/dark
	--end
	-- 防止生成在陆地之外的地方
	if not TileGroupManager:IsLandTile(tile) then
		--print("Can't spawn "..tostring(prefab).." because of water tile.")
		return
	end
	if clear_area ~= nil then
		local ents = TheSim:FindEntities(x,0,y,1)
		if #ents > 0 then
			--print("Can't spawn "..tostring(prefab).." because of:")
			--for i,v in ipairs(ents) do
			--	print("\t"..tostring(v.prefab))
			--end
			return
		end
	end
	local new = SpawnPrefab(prefab)
	if new then
		--new.persists = false --??
        new.Transform:SetPosition(x,0,y)
        if new.components.burnable then
            new:RemoveComponent("burnable") --The items spawned at portal cannot be hammered or burned! 在大门产生的物品不能被锤击或燃烧！
        end
		if new.components.workable then
			new:RemoveComponent("workable")
		end
		new.permanententity = true	--To make sure the unburnability/hammerability persists through rollbacks and 2nd time world loads  确保在回档/重新加载世界的时候也不能被锤或燃烧
	end
	--print("Spawned")
	return new
end

--То же, что и предыдущая функция, только указываются радиус и угол (вверх = 0, далее по часовой)
local function SafeSpawnPrefabR(prefab,radius,theta,obj,...)
	local alpha = -theta - _G.PI * 0.75
	local x1=math.cos(alpha)*radius
	local z1=math.sin(alpha)*radius
	--print(x1,z1)
	return SafeSpawnPrefab(prefab,x1,z1,obj,...)
end

local PORTAL
-- 绚丽之门
AddPrefabPostInit("multiplayer_portal",function(inst)
	PORTAL = inst
end)
-- 建造中的天体传送门
AddPrefabPostInit("multiplayer_portal_moonrock_constr",function(inst)
	PORTAL = inst
end)
-- 天体传送门
AddPrefabPostInit("multiplayer_portal_moonrock",function(inst)
	PORTAL = inst
end)
-- 初始化世界
local position = _G.tonumber(TUNING.SLOTMACHINE_MODCONFIGDATA["position"]) or 1
AddWorldPostInit(function(inst)
	--w.data_players.slotmachine_spawned = nil
	local slotmachinespawned = false 	--Slot machine by default hasn't spawned 
	inst:DoTaskInTime(0,function(inst)
		if position == 1 and PORTAL == nil then
			position = 2 --slot machine spawns center of world if there is no portal 如果配置项为出生门附近生成，但是世界没有出生门，就在世界中心生成
		end
		if w.data_players.slotmachine_spawned == nil or position ~= w.data_players.slotmachine_spawned then
			if w.data_players.slotmachine_spawned ~= nil and w.data_players.slotmachine_spawned > 0 then
				local ents = TheSim:FindEntities(0,0,0,10000,{"slotmachine"})	--Checking how many slot machines the world has
				for i,v in ipairs(ents) do
					if v.prefab == "slotmachine" and v.permanententity == true then	--If there are slot machines that are permanently spawning ones: 如果存在一些永恒的老虎机
						--v:Remove()
						slotmachinespawned = true	--then we set this value to true, hence we spawn no more! 设置这个值为true，这样在加载世界的时候就不会生成更多
					end
				end
			end
			w.data_players.slotmachine_spawned = position
			-- 如果还没有生成老虎机
			if slotmachinespawned == false then
				if position == 0 then
					return
				end
				if position == 1 then --near portal
					SafeSpawnPrefabR("slotmachine", 6, -_G.PI * 0.45, PORTAL)
				end
				if position == 2 then --center
					local slot_machine
					local pt = {x=0,y=0,z=0}
					local r = 0
					repeat
						r = r + 0.1
						slot_machine = SafeSpawnPrefabR("slotmachine", r, _G.PI * 2 * math.random(), pt, true)
					until slot_machine ~= nil or r > 300
				end
				if position >= 3 then --random place
					local slot_machine
					local pt = {x=0,y=0,z=0}
					local n = 0
					repeat
						n = n + 1
						slot_machine = SafeSpawnPrefabR("slotmachine", 1500 * math.random(), _G.PI * 2 * math.random(), pt, true)
					until slot_machine ~= nil or n > 5000
				end
			end
		end
	end)
end)

--防止初始老虎机被分解
--Code to prevent starting structures from being deconstructed!
local old_castspell_action = ACTIONS.CASTSPELL.fn
ACTIONS.CASTSPELL.fn = function(act)
	local cancast = true
	local staffinhand = nil
			if act.doer.components.inventory ~= nil then
		if act.invobject == nil then
			staffinhand = act.doer.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		else
			staffinhand = act.invobject
		end
	end

	if act.target ~= nil and act.target.permanententity and staffinhand.prefab == "greenstaff" then
		cancast = false
	end

	if cancast then
		return old_castspell_action(act)
	else
		if act.doer ~= nil and act.doer.userid ~= nil and act.doer.components.talker then
			act.doer:DoTaskInTime(1, function(inst)
				act.doer.components.talker:Say(STRINGS.SLOTMACHINE_OTHER_TEXT.CANNOT_DECONSTRUCT)
			end)
		end
	end
end

if IsGiftMachine then
	AddComponentPostInit("giftreceiver", function(self)
		local original_SetGiftMachine = self.SetGiftMachine
		self.SetGiftMachine = function(self, inst)
		   local pos = self.inst:GetPosition()
		   local ents = _G.TheSim:FindEntities(pos.x, pos.y, pos.z, _G.TUNING.RESEARCH_MACHINE_DIST, { "giftmachine", "structure" }, { "INLIMBO", "burnt" })
		   local gift_inst = nil
		   for _,ent in ipairs(ents) do
			  gift_inst = ent
			  break
		   end
		   inst = gift_inst ~= nil and gift_inst:HasTag("giftmachine") and _G.CanEntitySeeTarget(self.inst, gift_inst) and self.inst.components.inventory.isopen and gift_inst or nil
		   original_SetGiftMachine(self, inst)
		end
	 end)
end

local function MyCustomOnPhaseTransition1(inst)
    local px, py, pz = inst.Transform:GetWorldPosition()
    local target = inst.components.combat.target
    print("Custom phase transition logic!")
	local origion = inst.origion
    inst:Remove()
	-- if origion == "slotmachine" then  --阻断向二阶段转化
	-- 	return
	-- end
    local phase2 = SpawnPrefab("alterguardian_phase2")
	phase2.origion = origion
    phase2.Transform:SetPosition(px, py, pz)
    phase2.components.combat:SuggestTarget(target)
    phase2.sg:GoToState("spawn")
end
AddPrefabPostInit("alterguardian_phase1", function(inst)
	GlobalCheck(inst)
	inst.OnSave = function (inst, data)
		if inst.origion ~= nil then
			data.origion = inst.origion
		end
	end
    inst.OnLoad = function (inst, data)
		if data ~= nil and data.origion ~= nil then
			inst.origion = data.origion
		end
	end
	if inst and inst.event_listeners then
		inst:ListenForEvent("phasetransition_custom", MyCustomOnPhaseTransition1)
	end
end)
AddStategraphPostInit("alterguardian_phase1", function(sg)
	local oldOnTimeOutDeth = sg.states.death.ontimeout
    sg.states.death.ontimeout = function(inst, ...)
		inst:PushEvent("phasetransition_custom")
    end
end)

local function MyCustomOnPhaseTransition2(inst)
    local px, py, pz = inst.Transform:GetWorldPosition()
    local target = inst.components.combat.target
    print("Custom phase transition logic!")
	local origion = inst.origion
    inst:Remove()
	-- if origion == "slotmachine" then --阻断向三阶段转化
	-- 	print("天体2")
	-- 	return
	-- end 
	local phase3 = SpawnPrefab("alterguardian_phase3")
	phase3.origion = origion
    phase3.Transform:SetPosition(px, py, pz)
    phase3.components.combat:SuggestTarget(target)
    phase3.sg:GoToState("spawn")
end
AddPrefabPostInit("alterguardian_phase2", function(inst)
	GlobalCheck(inst)
	inst.OnSave = function (inst, data)
		if inst.origion ~= nil then
			data.origion = inst.origion
		end
	end
    inst.OnLoad = function (inst, data)
		if data ~= nil and data.origion ~= nil then
			inst.origion = data.origion
		end
	end
	if inst and inst.event_listeners then
		inst:ListenForEvent("phasetransition_custom", MyCustomOnPhaseTransition2)
	end
end)
AddStategraphPostInit("alterguardian_phase2", function(sg)
	local oldOnTimeOutDeth = sg.states.death.ontimeout
    sg.states.death.ontimeout = function(inst, ...)
		inst:PushEvent("phasetransition_custom")
    end
end)


AddPrefabPostInit("alterguardian_phase3", function(inst)
	GlobalCheck(inst)
	inst.OnSave = function (inst, data)
		if inst.origion ~= nil then
			data.origion = inst.origion
		end
	end
    inst.OnLoad = function (inst, data)
		if data ~= nil and data.origion ~= nil then
			inst.origion = data.origion
		end
	end
end)
AddStategraphPostInit("alterguardian_phase3", function(sg)
	local oldOnEnter = sg.states.death.onenter
	local oldEvents = sg.states.death.events
	local function set_lightvalues(inst, val)
		inst.Light:SetIntensity(0.60 + (0.39 * val * val))
		inst.Light:SetRadius(5 * val)
		inst.Light:SetFalloff(0.85)
	end
	sg.states.death.onenter = function(inst)
		inst.components.locomotor:StopMoving()

		inst.AnimState:SetBuild("alterguardian_spawn_death")
		inst.AnimState:SetBankAndPlayAnimation("alterguardian_spawn_death", "phase3_death")

		RemovePhysicsColliders(inst)

		set_lightvalues(inst, 0.9)
		if  inst.origion ~= "slotmachine" then
			TheWorld:PushEvent("moonboss_defeated")
		end

		inst:SetNoMusic(true)
		if inst.origion == "slotmachine" then
			inst:DoTaskInTime(3.5, function (inst)
				inst:Remove()
			end)
		end
	end
end)

modimport("main/manualCleanup")
modimport("main/autoStack")

