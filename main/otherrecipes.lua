-- 其他配方表
local otherRecipes = {
    {name = "carnival_gametoken_multiple2",
     ingredients = {Ingredient("carnival_prizeticket", math.floor(30/TUNING.SLOTMACHINE_MODCONFIGDATA["Difficulty"]^0.5+0.5))},
     tech = TECH.CARNIVAL_PRIZESHOP_ONE,
     config = {no_deconstruction=true, nil, nounlock=true, nil, nil, sg_state="give", description="carnival_gametoken_multiple", numtogive=3, product="carnival_gametoken", image="carnival_gametoken_multiple.tex"},
     filters = {"CRAFTING_STATION"}
    },
    {name = "goldnugget",
     ingredients = {Ingredient("dubloon", math.floor(3*TUNING.SLOTMACHINE_MODCONFIGDATA["Difficulty"]^0.5+0.5), "images/slotm_inventory.xml")},
     tech = TUNING.SLOTMACHINE_MODCONFIGDATA["ShopScience"],
     config = {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
     filters = {"REFINE"},
     sortkey = -20
    },
    {name = "slotmachine",
     ingredients = {Ingredient("boards", 4), Ingredient("cutstone", 2), Ingredient("goldnugget", 4)},
     ingredients1 = {Ingredient("boards", 4), Ingredient("cutstone", 2), Ingredient("goldnugget", 4)},
     ingredients2 = {Ingredient("boards", 20), Ingredient("cutstone", 10), Ingredient("goldnugget", 20)},
     ingredients3 = {Ingredient("boards", 40), Ingredient("cutstone", 20), Ingredient("goldnugget", 40)},
     ingredients4 = {Ingredient("boards", 50), Ingredient("cutstone", 25), Ingredient("goldnugget", 50), Ingredient("greengem", 10)},
     ingredients5 = {Ingredient("boards", 100), Ingredient("cutstone", 100), Ingredient("goldnugget", 100), Ingredient("greengem", 20)},
     tech = TUNING.SLOTMACHINE_MODCONFIGDATA["MachineScience"],
     config = {placer  = "slotmachine_placer", min_spacing = 3.2, nil, nil, nil, atlas = "images/Slotmachine.xml", nil, nil, nil, nil, nil, testfn=function(pt) return TheWorld.Map:GetPlatformAtPoint(pt.x, 0, pt.z, -0.5) == nil end},
     filters = {"MAGIC","STRUCTURES"},
     sortkey = -10
    },
    {name = "slotmachine",
     ingredients = {Ingredient("boards", 4), Ingredient("cutstone", 2), Ingredient("dubloon", 4)},
     ingredients1 = {Ingredient("boards", 4), Ingredient("cutstone", 2), Ingredient("dubloon", 4)},
     ingredients2 = {Ingredient("boards", 20), Ingredient("cutstone", 10), Ingredient("dubloon", 20)},
     ingredients3 = {Ingredient("boards", 40), Ingredient("cutstone", 20), Ingredient("dubloon", 40)},
     ingredients4 = {Ingredient("boards", 50), Ingredient("cutstone", 25), Ingredient("dubloon", 50), Ingredient("greengem", 10)},
     ingredients5 = {Ingredient("boards", 100), Ingredient("cutstone", 100), Ingredient("dubloon", 100), Ingredient("greengem", 20)},
     tech = TECH.NONE,
     config = {placer  = "slotmachine_placer", min_spacing = 3.2, nil, nil, nil, atlas = "images/Slotmachine.xml", nil, nil, nil, nil, nil, testfn=function(pt) return TheWorld.Map:GetPlatformAtPoint(pt.x, 0, pt.z, -0.5) == nil end},
     filters = {"MAGIC","STRUCTURES"},
     tag = {"Island"},
     sortkey = -10
    },
}

-- 定义一个函数来根据配置添加配方
local function AddOtherRecipes(config)
    local r = 0  -- 配方计数
    for _, data in ipairs(config) do
        if data.name ~= "slotmachine" then
            r = r + 1
            local recipe = AddRecipe2(data.name, data.ingredients, data.tech, data.config, data.filters)
            if data.sortkey then
                recipe.sortkey = data.sortkey
            end
        else
            if (not TUNING.SLOTMACHINE_MODCONFIGDATA["workshop-1467214795".."_enable"]  and not data.tag ) or (TUNING.SLOTMACHINE_MODCONFIGDATA["workshop-1467214795".."_enable"] and table.contains(data.tag, "Island")) then
                r = r + 1
                if TUNING.SLOTMACHINE_MODCONFIGDATA["SlotMachineDifficulty"] then
                    data.ingredients = data["ingredients"..TUNING.SLOTMACHINE_MODCONFIGDATA["SlotMachineDifficulty"]]
                end
                local recipe = AddRecipe2(data.name, data.ingredients, data.tech, data.config, data.filters)
                if data.sortkey then
                    recipe.sortkey = data.sortkey
                end
            end
        end
    end
    print("额外配方数: " .. r)
end
AddOtherRecipes(otherRecipes)