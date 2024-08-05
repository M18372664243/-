local assets=
{
	Asset("ANIM", "anim/dubloon.zip"),
	Asset("IMAGE", "images/slotm_inventory.tex"),
	Asset("ATLAS", "images/slotm_inventory.xml"),
}

local prefabs =
{

}

local infstack = TUNING.SLOTMACHINE_MODCONFIGDATA["Infstack"]

local function shine(inst)
	-- if inst.task then
		-- inst.task:Cancel()
		inst.task = nil
	-- end

	if inst.components.floater:IsFloating() then
		inst.AnimState:PlayAnimation("sparkle_water")
		inst.AnimState:PushAnimation("idle_water")
	else
		inst.AnimState:PlayAnimation("sparkle")
		inst.AnimState:PushAnimation("idle")
	end

	if inst.entity:IsAwake() then
		inst.task = inst:DoTaskInTime(4+math.random()*5, shine)
	end
end

local function onwake(inst)
	inst.task = inst:DoTaskInTime(4+math.random()*5, function() shine(inst) end)
end

local function onsleep(inst)
end

local function fn(Sim)
	
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddPhysics()
	inst.entity:AddNetwork()

	inst.OnEntityWake = onwake
	inst.OnEntitySleep = onsleep

	MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "med", nil, 0.68)

	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )	 
	
	inst.AnimState:SetBank("dubloon")
	inst.AnimState:SetBuild("dubloon")
	inst.AnimState:PlayAnimation("idle")
	
	inst.pickupsound = "metal"	--New pickup sounds!
	
	inst:AddTag("currency")
	inst:AddTag("molebait")
	inst:AddTag("oceanfishing_lure")		--For letting these be stored inside tackle containers!
	inst:AddTag("halloweencandy")			--For letting these be stored inside candy bags!
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("edible")		--Now feedable to moles again, by request! 
	inst.components.edible.foodtype = "ELEMENTAL"
	inst.components.edible.hungervalue = 1
	
	--inst:AddComponent("currency")
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
	--inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	if infstack == true then 
		inst.components.stackable:SetIgnoreMaxSize(true)	--Infinite! this is COOL
	else
		inst.components.stackable.maxsize = TUNING.STACK_SIZE_TINYITEM		--it's a number, get used to it!
	end
	
	inst:AddComponent("selfstacker") --Dubloons can self stack now! 

	--inst:AddComponent("appeasement")
	--inst.components.appeasement.appeasementvalue = TUNING.APPEASEMENT_TINY

	inst:AddComponent("waterproofer")
	inst.components.waterproofer.effectiveness = 0
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/slotm_inventory.xml"

	inst:AddComponent("tradable")
	
	inst:AddComponent("bait")
	
	MakeHauntableLaunchAndSmash(inst)
	
	return inst
end

return Prefab( "common/inventory/dubloon", fn, assets, prefabs)
