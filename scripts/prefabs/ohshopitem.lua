local assets = {
	Asset("ANIM", "anim/ohshop_item.zip"),
	Asset("ATLAS", "images/ohcoin10.xml"),
	Asset("ATLAS", "images/ohcoinrandom.xml"),
	Asset("IMAGE", "images/ohcoin10.tex"),
	Asset("IMAGE", "images/ohcoinrandom.tex"),
}

local function coin10()

	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddPhysics()
	inst.entity:AddNetwork()
	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "med", nil, 0.68)
	inst.AnimState:SetBank("ohshop_item")
	inst.AnimState:SetBuild("ohshop_item")
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("ohshop_item", "ohshop_item", "ohcoin10")
	inst:AddTag("currency")
	inst:AddTag("molebait")
	inst:AddTag("oceanfishing_lure")
	inst:AddTag("halloweencandy")
	inst.entity:SetPristine()
	if not TheWorld.ismastersim then
		return inst
	end
	inst:AddComponent("edible")
	inst.components.edible.foodtype = "ELEMENTAL"
	inst.components.edible.hungervalue = 1
	inst:AddComponent("inspectable")
	inst:AddComponent("stackable")
	inst.components.stackable:SetIgnoreMaxSize(true)
	inst:AddComponent("selfstacker") --Dubloons can self stack now!
	inst:AddComponent("waterproofer")
	inst.components.waterproofer.effectiveness = 0
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/ohcoin10.xml"
	inst:AddComponent("tradable")
	inst:AddComponent("bait")
	MakeHauntableLaunchAndSmash(inst)
	return inst
end

local function coinrandom()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddPhysics()
	inst.entity:AddNetwork()
	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "med", nil, 0.68)
	inst.AnimState:SetBank("ohshop_item")
	inst.AnimState:SetBuild("ohshop_item")
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("ohshop_item", "ohshop_item", "ohcoinrandom")
	inst:AddTag("currency")
	inst:AddTag("molebait")
	inst:AddTag("oceanfishing_lure")
	inst:AddTag("halloweencandy")
	inst.entity:SetPristine()
	if not TheWorld.ismastersim then
		return inst
	end
	inst:AddComponent("edible")
	inst.components.edible.foodtype = "ELEMENTAL"
	inst.components.edible.hungervalue = 1
	inst:AddComponent("inspectable")
	inst:AddComponent("stackable")
	inst.components.stackable:SetIgnoreMaxSize(true)
	inst:AddComponent("selfstacker")
	inst:AddComponent("waterproofer")
	inst.components.waterproofer.effectiveness = 0
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/ohcoinrandom.xml"
	inst:AddComponent("tradable")

	inst:AddComponent("bait")

	MakeHauntableLaunchAndSmash(inst)
	return inst
end



return Prefab("common/inventory/ohcoin10", coin10,assets),
Prefab("common/inventory/ohcoinrandom", coinrandom,assets)

