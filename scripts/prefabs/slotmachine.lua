require "prefabutil"
local slotmachineutils = require "modules.slotmachineutils"
local assets = 
{
	Asset("ANIM", "anim/slot_machine.zip"),
 --   Asset("MINIMAP_IMAGE", "slot_machine"),
}

local prefabs =
{
	"redgem",
	"bluegem",
	"purplegem",
	"collapse_small",	
	"dubloon",
	"antliontrinket",
	"trinket_25",		--Air Unfreshener, bad drops!
	"trinket_26",		--Potato Cup, good drops!
	"ohcoin10",
	"coinrandom",
}
local IsGiftMachine = TUNING.SLOTMACHINE_MODCONFIGDATA["IsGiftMachine"]


--Slot machine misc configs!
local Decaytime = TUNING.SLOTMACHINE_MODCONFIGDATA["Decaytime"]

local actions =
{

}

local treasurehunt = require "treasurehunt"

-- 初始化存储结果的表
local goodspawns = {}
local okspawns = {}
local badspawns = {}
local disabledspawns = {}
local zerospawns = {}
local unknowngroup = {} -- 新增用于存放group_tag为nil的项
-- 初始化fail_prefab表来存储不存在的Prefab;表示程序bug
local fail_prefab = {}
local goodWeightSum = 0
local okWeightSum = 0
local badWeightSum = 0
local prizeWeightSum = 0
do
	-- 遍历internalloot表进行分类和计算
	for key, data in pairs(treasurehunt) do
		if data ~= nil then
			if data.disabled then
				-- 如果项目被禁用，则放入disabledspawns表
				disabledspawns[key] = data
			else
				-- 如果classify_tag为nil，则直接放入zerospawns
				if data.classify_tag == nil then
					zerospawns[key] = data
				else
					-- 计算classify_tag对应的数值的乘积
					local classify_multiplier = 1
					for _, tag in ipairs(data.classify_tag) do
						--print("tag", TUNING.SLOTMACHINE_MODCONFIGDATA[tag])
						local value = TUNING.SLOTMACHINE_MODCONFIGDATA[tag] or 1 -- 如果标签数值未定义，则默认为1
						value = value < 0 and 0 or value -- 确保值不为负数
						classify_multiplier = classify_multiplier * value
					end

					-- 根据计算结果和group_tag进行分类存储
					if classify_multiplier == 0 then
						zerospawns[key] = data -- 计算结果为0，放入zerospawns表
					else
						-- 如果group_tag为nil，则放入unknowngroup表中
						if data.group_tag == nil then
							unknowngroup[key] = data
						else
							-- 校验loot里面的所有prefab是否已载入
							local allPrefabOfLootIsExist = true
							if data.loot ~= nil then
								for k, _ in pairs(data.loot) do
									if fail_prefab[k] == nil and not PrefabExists(k) then
										allPrefabOfLootIsExist = allPrefabOfLootIsExist and false
										table.insert(fail_prefab, k) -- 如果Prefab不存在（mod物品取决于相对本mod的加载顺序，所以并不一定真的不存在，没有更好的办法去判断一个物品是否存在，所以并不会真的把这些物品移除，只做记录）；
									end
								end
							end
							--if allPrefabOfLootIsExist then
								if table.contains(data.group_tag, "good") then
									goodspawns[key] = classify_multiplier
									goodWeightSum = goodWeightSum + classify_multiplier
								elseif table.contains(data.group_tag, "ok") then
									okspawns[key] = classify_multiplier
									okWeightSum = okWeightSum + classify_multiplier
								elseif table.contains(data.group_tag, "bad") then
									badspawns[key] = classify_multiplier
									badWeightSum = badWeightSum + classify_multiplier
								else
									unknowngroup[key] = data
								end
							--end
						end
					end
				end
			end
		else
			print("Warning: Nil data found for key: " .. key)
		end
	end

	for k, v in pairs(TUNING.SLOTMACHINE_MODCONFIGDATA["PrizeValues"]) do
		prizeWeightSum  = prizeWeightSum + v
	end
end


if TUNING.SLOTMACHINE_MODCONFIGDATA["logSwitch"] then
	local function divide_and_format_as_percentage(numerator, denominator)
		if denominator ~= 0 then
			local percentage = string.format("%.2f%%", (numerator / denominator) * 100)
			return percentage
		else
			return "无穷大%" -- 或者其他错误处理
		end
	end


	print("++++++++++++++++++++++++++++++++++大分类权重 START++++++++++++++++++++++++++++++++++")
	local prizeRateTable = {}
	for k, v in pairs(TUNING.SLOTMACHINE_MODCONFIGDATA["PrizeValues"]) do
		print(k, v, divide_and_format_as_percentage(v, prizeWeightSum))
		prizeRateTable[k] = v/prizeWeightSum
	end
	print("++++++++++++++++++++++++++++++++++大分类权重 END++++++++++++++++++++++++++++++++++")
	print("++++++++++++++++++++++++++++++++++小分类权重 START++++++++++++++++++++++++++++++++++")
	for k, v in pairs(TUNING.SLOTMACHINE_MODCONFIGDATA["ClassifyValues"]) do
		print(k, v)
	end
	print("++++++++++++++++++++++++++++++++++小分类权重 END++++++++++++++++++++++++++++++++++")
	print("++++++++++++++++++++++++++++++++++模组物品权重 START++++++++++++++++++++++++++++++++++")
	for k, v in pairs(TUNING.SLOTMACHINE_MODCONFIGDATA["ModValues"]) do
		print(k, v)
	end
	print("++++++++++++++++++++++++++++++++++模组物品权重 END++++++++++++++++++++++++++++++++++")
	print("\n----------------------------------treasurehunt COUNT:"..GetTableSize(treasurehunt).."----------------------------------\n")
	print("----------------------------------goodspawns COUNT:"..GetTableSize(goodspawns).."----------------------------------")
	print("----------------------------------okspawns COUNT:"..GetTableSize(okspawns).."----------------------------------")
	print("----------------------------------badspawns COUNT:"..GetTableSize(badspawns).."----------------------------------")
	print("----------------------------------disabledspawns COUNT:"..GetTableSize(disabledspawns).."----------------------------------")
	print("----------------------------------zerospawns COUNT:"..GetTableSize(zerospawns).."----------------------------------")
	print("----------------------------------unknowngroup COUNT:"..GetTableSize(unknowngroup).."----------------------------------")
	print("----------------------------------fail_prefab COUNT:"..GetTableSize(fail_prefab).."----------------------------------")
	-- 打印结果

	print("++++++++++++++++++++++++++++++++++goodspawns START++++++++++++++++++++++++++++++++++")
	for k, v in pairs(goodspawns) do
		print(k, v, string.format("%.2f%%", (prizeRateTable["good"] * (v/goodWeightSum))* 100))
	end
	print("++++++++++++++++++++++++++++++++++goodspawns END++++++++++++++++++++++++++++++++++")


	print("++++++++++++++++++++++++++++++++++okspawns START++++++++++++++++++++++++++++++++++")
	for k, v in pairs(okspawns) do
		print(k, v,  string.format("%.2f%%", (prizeRateTable["ok"] * (v/okWeightSum))* 100))
	end
	print("++++++++++++++++++++++++++++++++++okspawns END++++++++++++++++++++++++++++++++++")


	print("++++++++++++++++++++++++++++++++++badspawns START++++++++++++++++++++++++++++++++++")
	for k, v in pairs(badspawns) do
		print(k, v, string.format("%.2f%%", (prizeRateTable["bad"] * (v/badWeightSum))* 100))
	end
	print("++++++++++++++++++++++++++++++++++badspawns END++++++++++++++++++++++++++++++++++")


	print("++++++++++++++++++++++++++++++++++disabledspawns START++++++++++++++++++++++++++++++++++")
	for k, v in pairs(disabledspawns) do
		print(k, v)
	end
	print("++++++++++++++++++++++++++++++++++disabledspawns END++++++++++++++++++++++++++++++++++")


	print("++++++++++++++++++++++++++++++++++zerospawns START++++++++++++++++++++++++++++++++++")
	for k, v in pairs(zerospawns) do
		print(k, v)
	end
	print("++++++++++++++++++++++++++++++++++zerospawns END++++++++++++++++++++++++++++++++++")


	print("++++++++++++++++++++++++++++++++++unknowngroup START++++++++++++++++++++++++++++++++++")
	for k, v in pairs(unknowngroup) do
		print(k, v)
	end
	print("++++++++++++++++++++++++++++++++++unknowngroup END++++++++++++++++++++++++++++++++++")


	print("++++++++++++++++++++++++++++++++++fail_prefab START++++++++++++++++++++++++++++++++++")
	for _, prefab in pairs(fail_prefab) do
		print(prefab)
		TheNet:Announce("不存在的物品："..prefab)
	end
	print("++++++++++++++++++++++++++++++++++fail_prefab END++++++++++++++++++++++++++++++++++")
end



local function GetTreasureLootList(reward)
	local lootlist = {}
	local loots = treasurehunt[reward]
	if loots then
		if loots.loot then
			for prefab, n in pairs(loots.loot) do
				if lootlist[prefab] == nil then
					lootlist[prefab] = 0
				end
				lootlist[prefab] = lootlist[prefab] + n
			end
		end
		if loots.random_loot then
			for i = 1, (loots.num_random_loot or 1), 1 do
				local prefab = weighted_random_choice(loots.random_loot)
				if prefab then
					if lootlist[prefab] == nil then
						lootlist[prefab] = 0
					end
					lootlist[prefab] = lootlist[prefab] + 1
				end
			end
		end
		if loots.chance_loot then
			for prefab, chance in pairs(loots.chance_loot) do
				if math.random() < chance then
					if lootlist[prefab] == nil then
						lootlist[prefab] = 0
					end
					lootlist[prefab] = lootlist[prefab] + 1
				end
			end
		end
		if loots.custom_lootfn then
			loots.custom_lootfn(lootlist)
		end
	end
	return lootlist
end

--[[local sounds = 
{
	ok = "dontstarve_DLC002/common/slotmachine_mediumresult",
	good = "dontstarve_DLC002/common/slotmachine_goodresult",
	bad = "dontstarve_DLC002/common/slotmachine_badresult",
}]]

local sounds = 
{
	ok = "ia/common/slotmachine/mediumresult",
	good = "ia/common/slotmachine/goodresult",
	bad = "ia/common/slotmachine/badresult",
	hit = "dontstarve/creatures/krampus/beenbad_lvl2",
}


local function SpawnCritter(inst, player, critter, lootdropper, pt, delay)
	delay = delay or GetRandomWithVariance(1,0.8)
	inst:DoTaskInTime(delay, function() 
		SpawnPrefab("collapse_small").Transform:SetPosition(pt:Get())
		local spawn = lootdropper:SpawnLootPrefab(critter, pt)
		if spawn and spawn.components.combat then
			spawn.components.combat:SetTarget(player)
		end
	end)
end

-- 发送公告
local function doAnnounce(slotOfLoots, player, magnification)
	local magnificationString = nil
	if magnification ~= nil and magnification > 1 then
		magnificationString = string.format(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.MAGNIFICATION_TEMPLATE, magnification)
	end
	if slotOfLoots.announce and slotOfLoots.announce.isAnnounced and slotOfLoots.announce.announceFuc and player~=nil then
		local itemName = "MISS NAME"
		local announceTemplate = slotOfLoots.announce.announceTemplate
		if slotOfLoots.announce.itemName ~= nil then
			itemName = slotOfLoots.announce.itemName
		else
			if slotOfLoots.loot then
				local lootItems = {}
				for key, value in pairs(slotOfLoots.loot) do
					local itemName = STRINGS.NAMES[string.upper(key)]
					local itemCount = value
					table.insert(lootItems, string.format("%sX%d", itemName, itemCount))
				end
				itemName = table.concat(lootItems, ";")
			end
		end
		slotOfLoots.announce.announceFuc(announceTemplate, player:GetDisplayName(), itemName, magnificationString, slotOfLoots.announce.templateArgs )
	else
		-- 如果没有开启公告的物品倍率不为1的时候公告倍率
		if magnification > 1 then
			TheNet:Announce(magnificationString)
		end
	end
end

local function SpawnReward(inst, player, reward, lootdropper, pt, delay, timeInterval, magnification)
	delay = delay or GetRandomWithVariance(1,0.8)
	magnification = magnification or 1
	timeInterval = timeInterval or 0.25
	timeInterval = timeInterval/magnification
	local loots = GetTreasureLootList(reward)
	-- 获取对应loots在treasurehunt中的完整属性
	local slotOfLoots = treasurehunt[reward]
	local funcSlot = slotOfLoots.rollFuc
	for _ =1,magnification do
		if loots ~= nil then
			for k, v in pairs(loots) do
				for _ = 1, v, 1 do
					inst:DoTaskInTime(delay, function(inst)
						--Replaced with IA Code, thank you guys!
						local angle
						local spawnangle
						local sp = math.random()*3+2
						local x, y, z = inst.Transform:GetWorldPosition()

						if player ~= nil and player:IsValid() then
							angle = (225 - math.random()*90 - player:GetAngleToPoint(x, 0, z))*DEGREES
							spawnangle = player:GetAngleToPoint(x, 0, z)*DEGREES
						else
							local down = TheCamera:GetDownVec()
							angle = math.atan2(down.z, down.x) + (math.random()*90-45)*DEGREES
							spawnangle = math.atan2(down.z, down.x)
							player = nil
						end

						local item = SpawnPrefab(k)

						if item == nil then
							print("CAN't SPAWN PREFAB: ",k)
						else
							item.origion = "slotmachine"
							if item.components.inventoryitem and not item.components.health and not item.components.locomotor and item.Physics ~= nil then	--
								local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(2*math.cos(spawnangle), 3, 2*math.sin(spawnangle))
								--inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/slotmachine_reward")
								inst.SoundEmitter:PlaySound("ia/common/slotmachine/reward")
								item.Transform:SetPosition(pt:Get())
								item.Physics:SetVel(sp*math.cos(angle), math.random()*2+9, sp*math.sin(angle))
								--item.components.inventoryitem:OnStartFalling()
							else	--this item has special physics, is alive or can move
								local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(2*math.cos(spawnangle), 0, 2*math.sin(spawnangle))
								pt = pt + Vector3(sp*math.cos(angle), 0, sp*math.sin(angle))
								item.Transform:SetPosition(pt:Get())
								SpawnPrefab("collapse_small").Transform:SetPosition(pt:Get())
							end

							if item and item:IsValid() and item.Physics ~= nil then
								if inst and item.components.visualvariant then
									item.components.visualvariant:CopyOf(inst, true)
								end
								if item.components.inventoryitem and not item.components.health and not item.components.locomotor and not item:HasTag("heavy") and not item:HasTag("firefly") then	--IA fix, thank you Arti :)  and not item.components.locomotor and
									local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(1*math.cos(angle), 3, 1*math.sin(angle))
									inst.SoundEmitter:PlaySound("ia/common/slotmachine/reward")
									item.Transform:SetPosition(pt:Get())
									item.Physics:SetVel(sp*math.cos(angle), math.random()*2+9, sp*math.sin(angle))
									item.components.inventoryitem:SetLanded(false, true)
								else
									local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(2*math.cos(angle), 0, 2*math.sin(angle))
									pt = pt + Vector3(sp*math.cos(angle), 0, sp*math.sin(angle))
									item.Transform:SetPosition(pt:Get())
									if not item:HasTag("fx") then
										SpawnPrefab("collapse_small").Transform:SetPosition(pt:Get())
									end
								end
							end
							-- 带鹿的克劳斯;若果key不是bad_klaus那就是狂暴克劳斯
							if("klaus" == k and "bad_klaus" == reward) then
								item:SpawnDeer()
							end
							item:DoTaskInTime(1,function(inst) slotmachineutils.auto_stack_fn(Vector3(item.Transform:GetWorldPosition()), item)  end)
						end
						-- if i == v then
						-- 	inst.components.trader.enabled = true
						-- end

						--Item autocleanup code!
						if Decaytime > 0 and item ~= nil then 		--The item should never be nil, but i did have a crash bc a prefab didnt exist :(
							local function FXSpawn(fx, master)		--FX master function
								x, y, z = master.Transform:GetWorldPosition()
								local ent = SpawnPrefab(fx)
								ent.Transform:SetPosition(x,y,z)
							end
							if (item.components.inventoryitem ~= nil or item.components.health ~= nil or item.components.locomotor ~= nil) and (not item:HasTag("smallcreature") or item:HasTag("monster") or item:HasTag("hostile")) then 		--This one only applies to items you can pick up or are alive besides passive small creatures!
								local decaytask = nil 	--Setting this up locally per each object!
								local timetask = nil
								item.decaytimer = Decaytime	 --Decay Timer
								decaytask = item:DoTaskInTime(Decaytime, function(inst)
									x, y, z = item.Transform:GetWorldPosition()	--record the item's location!
									if item.components.inventoryitem ~= nil and item.components.health == nil and item.components.locomotor == nil then
										FXSpawn("small_puff", item)
									else
										FXSpawn("shadow_puff_large_front", item)
										FXSpawn("shadow_puff_large_back", item)
										FXSpawn("willow_shadow_fire_explode", item)
									end
									item:Remove()								--remove item!
									--print("Item vanished!")					--Print line for testing purposes :)
								end)
								timetask = item:DoPeriodicTask(1, function(inst)
									item.decaytimer = item.decaytimer - 1 	--Removing one value per second :) d
									--print("item " .. item.prefab .. " " .. item.GUID .. " vanishing in " .. item.decaytimer .. " seconds")	--For Testing
								end)
								local function TaskCancel(inst)
									if decaytask ~= nil then
										decaytask:Cancel()
									end
									if timetask ~= nil then
										timetask:Cancel()
									end
									item.decaytimer = nil	--Void the expiration time :)
								end
								item:ListenForEvent("onpickup", TaskCancel)		--When items are picked up
								item:ListenForEvent("equipped", TaskCancel)		--When items are equipped direct to inv (happens if you got an empty slot and pick something up)
								item:ListenForEvent("attacked", TaskCancel)		--When entities are attacked
								item:ListenForEvent("trade",  TaskCancel)		--When you give an entity an item and it accepts it
							end
						end

					end)
					delay = delay + timeInterval
				end
			end
		end
	end
	-- buff类不会有倍率
	if funcSlot ~= nil then
		for k, func in pairs(funcSlot) do
			if func ~= nil then
				inst:DoTaskInTime(delay,func(inst, player))
			end
		end
	end
	inst:DoTaskInTime(delay,function() inst.components.trader.enabled = true end)
	-- 发送公告
	doAnnounce(slotOfLoots, player, magnification)
end


local function PickPrize(inst,giver,item)

	inst.busy = true
	--  设置是谁投的币
	if giver ~= nil then
		inst.giver = giver;
	end
	inst.giveItem = item.prefab
	inst.magnification = 1
	if item.prefab == "ohcoin10" then
		inst.magnification = 10
	elseif item.prefab == "ohcoinrandom" then
		inst.magnification = math.random(TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationLowerLimit"], TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationUpperLimit"])
	end
	--print("item_prefab",tostring(item_prefab))
	local prizevalue
--	if item_prefab == "dubloon" or item_prefab == "redgem" or item_prefab == "bluegem" or item_prefab == "purplegem" or item_prefab == "trinket_1" or item_prefab == "trinket_2" or item_prefab == "trinket_3" or item_prefab == "trinket_4" or item_prefab == "trinket_5" or item_prefab == "trinket_6" or item_prefab == "trinket_7" or item_prefab == "trinket_8" or item_prefab == "trinket_9" or item_prefab == "trinket_10" or item_prefab == "trinket_11" or item_prefab == "trinket_12" or item_prefab == "trinket_13" or item_prefab == "trinket_14" or item_prefab == "trinket_15" or item_prefab == "trinket_16" or item_prefab == "trinket_17" or item_prefab == "trinket_18" or item_prefab == "trinket_19" or item_prefab == "trinket_20" or item_prefab == "trinket_21" or item_prefab == "trinket_22" or item_prefab == "trinket_23" or item_prefab == "trinket_24" or item_prefab == "trinket_25" or item_prefab == "trinket_26" or item_prefab == "trinket_27" or item_prefab == "trinket_28" or item_prefab == "trinket_29" or item_prefab == "trinket_30" or item_prefab == "trinket_31" or item_prefab == "antliontrinket" or item_prefab == "trinket_32" or item_prefab == "trinket_33" or item_prefab == "trinket_34" or item_prefab == "trinket_35" or item_prefab == "trinket_36" or item_prefab == "trinket_37" or item_prefab == "trinket_38" or item_prefab == "trinket_39" or item_prefab == "trinket_40" or item_prefab == "trinket_41" or item_prefab == "trinket_42" or item_prefab == "trinket_43" or item_prefab == "trinket_44" or item_prefab == "trinket_45" or item_prefab == "trinket_46" then
	--                 金币                         红宝石                    蓝宝石                       紫宝石                         沙滩玩具                         能够吸引鼹鼠                     可交易                                 有价值                                                                                                                        万圣节纪念品                               
	if item.prefab == "dubloon" or item.prefab == "redgem" or item.prefab == "bluegem" or item.prefab == "purplegem" or item.prefab == "ohcoin10" or item.prefab == "ohcoinrandom" or item.prefab == "antliontrinket" or (item:HasTag("molebait") and item.components.tradable and item.components.tradable.goldvalue ~= 0 and item.prefab ~= "trinket_25" and item.prefab ~= "trinket_26") or (item:HasTag("molebait") and item:HasTag("halloween_ornament")) then
		prizevalue = weighted_random_choice(TUNING.SLOTMACHINE_MODCONFIGDATA["PrizeValues"])
		--print("slotmachine prizevalue", prizevalue)
		if prizevalue == "ok" then
			inst.prize = weighted_random_choice(okspawns)
		elseif prizevalue == "good" then
			inst.prize = weighted_random_choice(goodspawns)
		elseif prizevalue == "bad" then
			inst.prize = weighted_random_choice(badspawns)
		else
			-- impossible!
			print("Impossible slot machine prizevalue!", prizevalue)
		end
	elseif item.prefab == "trinket_25" then
		prizevalue = "bad"
		inst.prize = weighted_random_choice(badspawns)	--Guaranteed bad spawn! Let's see how this works
		--print("slotmachine prizevalue", prizevalue)
	elseif item.prefab == "trinket_26" then
		prizevalue = "good"
		inst.prize = weighted_random_choice(goodspawns)	--Guaranteed good spawn! Let's see how this works
		--print("slotmachine prizevalue", prizevalue)
	end

	inst.prizevalue = prizevalue
end
--抽奖结束生成物品
local function DoneSpinning(inst)
	local pos = inst:GetPosition()
	local item = inst.prize
	--local doaction = { treasure = item,}
	local player = inst.giver or FindClosestPlayerToInst(inst, 20, true)	--borrowed from IA code
	-- 倍率
	local magnification = math.random(TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationLowerLimit"], TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationUpperLimit"])
	-- 时间间隔
	local timeInterval = 0.1
	print("Slot machine treasure "..tostring(item))
	SpawnReward(inst, player, item, nil, nil, nil, timeInterval, inst.magnification)
	--local cnt = (doaction and doaction.cnt) or 1
	--local func = (doaction and doaction.callback) or nil
	--local radius = (doaction and doaction.radius) or 4
	--local treasure = (doaction and doaction.treasure) or nil
	--
	--if doaction and doaction.var then
	--	cnt = GetRandomWithVariance(cnt,doaction.var)
	--	if cnt < 0 then cnt = 0 end
	--end
	--
	--if cnt == 0 and func then
	--	func(inst,item,doaction)
	--end
	--
	--for i=1,cnt do
	--	local offset, check_angle, deflected = FindWalkableOffset(pos, math.random()*2*PI, radius , 8, true, false) -- try to avoid walls
	--	if offset then
	--		if treasure then
	--			print("Slot machine treasure "..tostring(treasure))
	--			-- SpawnTreasureLoot(treasure, inst.components.lootdropper, pos+offset)
	--			-- SpawnPrefab("collapse_small").Transform:SetPosition((pos+offset):Get())
	--			SpawnReward(inst, player, treasure)
	--		elseif func then
	--			func(inst,item,doaction)
	--		elseif item == "trinket" then
	--			SpawnCritter(inst, player, "trinket_"..tostring(math.random(NUM_TRINKETS)), inst.components.lootdropper, pos+offset)
	--		elseif item == "nothing" then
	--			-- do nothing
	--			print("Slot machine says you lose.")
	--		else
	--			print("Slot machine item "..tostring(item))
	--			SpawnCritter(inst, player, item, inst.components.lootdropper, pos+offset)
	--		end
	--	end
	--end

	-- the slot machine collected more coins
	inst.coins = inst.coins + 1
	inst.giver = nil
	--inst.AnimState:PlayAnimation("idle")
	inst.busy = false
	inst.prize = nil
	inst.prizevalue = nil
	inst.magnification = 1
	-- print("Slot machine has "..tostring(inst.coins).." dubloons.")
	inst.sg:GoToState("fake_idle")
end


local function StartSpinning(inst)
	inst.components.trader.enabled = false
	inst.sg:GoToState("spinning")
end

local function ShouldAcceptItem(inst, item)  
    -- 如果inst忙碌，或者被烧毁，或者有燃烧组件且正在燃烧，则不接受物品  
    if inst.busy or inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then  
        return false  
    end  
  
    -- 如果物品是特定类型，则接受  
    if item.prefab == "dubloon" or   
       item.prefab == "redgem" or   
       item.prefab == "bluegem" or   
       item.prefab == "purplegem" or   
       item.prefab == "antliontrinket" or
			item.prefab == "ohcoin10" or
			item.prefab == "ohcoinrandom" or
       (item:HasTag("molebait") and item.components.tradable and item.components.tradable.goldvalue ~= 0 and item.prefab ~= "trinket_26" and item.prefab ~= "trinket_26") or   
       (item:HasTag("molebait") and item:HasTag("halloween_ornament")) then  
        return true  
    end  
  
    -- 特殊情况：始终接受"trinket_25"和"trinket_26"  
    if item.prefab == "trinket_25" or item.prefab == "trinket_26" then  
        return true  
    end  
  
    -- 其他情况不接受物品  
    return false  
end

--Slot machine doesnt take sanity to use! Yay! 
local function OnGetItemFromPlayer(inst, giver, item)

	-- print("Slot machine takes your dubloon.")
--	giver.components.sanity:DoDelta(-TUNING.SANITY_TINY)

--	PickPrize(inst,item.prefab) (we want it to be able to pick dif prefab types through code!) 
	PickPrize(inst,giver,item)
	StartSpinning(inst)
end

local function OnRefuseItem(inst, item)
	-- print("Slot machine refuses "..tostring(item.prefab))
end

local function OnLoad(inst,data)
	if not data then
		return
	end
	
	inst.coins = data.coins or 0
	inst.prize = data.prize
	inst.prizevalue = data.prizevalue

	if inst.prize ~= nil then
		StartSpinning(inst)
	end
end

local function OnSave(inst,data)
	data.coins = inst.coins
	data.prize = inst.prize
	data.prizevalue = inst.prizevalue
end

--local function CalcSanityAura(inst, observer)
--	return -(TUNING.SANITYAURA_MED*(1+(inst.coins/100)))
--end

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_big")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("hit")
        inst.AnimState:PushAnimation("idle", false)
    end
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
	if inst.permanententity ~= nil then
		data.permanententity = inst.permanententity
	end
	if inst.slotrolls ~= nil then
		data.slotrolls = inst.slotrolls
	end
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
	if data ~= nil and data.permanententity ~= nil then
		inst.permanententity = data.permanententity
	end
	if data ~= nil and data.slotrolls ~= nil then
		inst.slotrolls = data.slotrolls
	end
end

local function fn()
	local inst = CreateEntity()

	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon( "Slotmachine.tex" )
	
	MakeObstaclePhysics(inst, 1)
	
	anim:SetBank("slot_machine")
	anim:SetBuild("slot_machine")
	anim:PlayAnimation("idle")
	
	inst:AddTag("structure")
	inst:AddTag("slotmachine")
	if IsGiftMachine then
		inst:AddTag("giftmachine")
	end
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.DoneSpinning = DoneSpinning
	inst.busy = false
	inst.sounds = sounds

	-- keeps track of how many dubloons have been added
	inst.coins = 0
	
	inst:AddComponent("inspectable")

	inst:AddComponent("lootdropper")

    MakeSnowCovered(inst)

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
    MakeSnowCovered(inst)

    MakeLargeBurnable(inst, nil, nil, true)
    MakeMediumPropagator(inst)
    inst.OnSave = onsave
    inst.OnLoad = onload

--	inst:AddComponent("payable")
--	inst.components.payable:SetAcceptTest(ShouldAcceptItem)
--	inst.components.payable.onaccept = OnGetItemFromPlayer
--	inst.components.payable.onrefuse = OnRefuseItem
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem

	--inst:AddComponent("sanityaura")
	--inst.components.sanityaura.aurafn = CalcSanityAura

	--inst:AddComponent("floodable")
	--inst.components.floodable.onStartFlooded = OnFloodedStart
	--inst.components.floodable.onStopFlooded = OnFloodedEnd
	--inst.components.floodable.floodEffect = "shock_machines_fx"
	--inst.components.floodable.floodSound = "dontstarve_DLC002/creatures/jellyfish/electric_land"
	inst:SetStateGraph("SGslotmachine")
	-- 根据配置项决定老虎机是否能被摧毁
	if not TUNING.SLOTMACHINE_MODCONFIGDATA["DestroySlotMachine"] then
		if inst.components.workable then
			inst:RemoveComponent("workable")
		end
		if inst.components.burnable then
			inst:RemoveComponent("burnable")
		end
	end
	return inst
end

return Prefab("slotmachine", fn, assets, prefabs),
    MakePlacer("slotmachine_placer", "slot_machine", "slot_machine", "idle")