local dubloonrefine = require "dubloonrefinetable"
-- --------------------------------------------金币精炼开始-----------------------------------------


local function InitNewShopFilterForRefine()
    AddRecipeFilter({name="DUBLOONREFINE",atlas="images/Slotmachine.xml",image="Slotmachine.tex"})
    AddRecipeToFilter("slotmachine","DUBLOONREFINE")
end
-- 定义一个函数来根据配置添加配方
local function AddDubloonRecipesFromConfig(config)
    local r = 0  -- 配方计数
    for _, data in ipairs(config) do
        local cost = data.cost
        local qty = data.qty or 1  -- 如果未指定数量，则默认为1
        local tech = data.tech or TUNING.SLOTMACHINE_MODCONFIGDATA["RefineScience"] or TECH.NONE
        if data.tag == nil
                or (data.tag and not table.contains(data.tag, "Island"))
                or (data.tag and table.contains(data.tag, "Island") and TUNING.SLOTMACHINE_MODCONFIGDATA["workshop-1467214795".."_enable"]) then
            local suffix = r
            if qty > 1 then
                suffix = "_"..data.item
            end
            local recipe = AddRecipe2("dubloon" .. suffix, {Ingredient(data.item, math.floor(cost / TUNING.SLOTMACHINE_MODCONFIGDATA["Difficulty"]^0.5 + 0.5))}, tech, {
                no_deconstruction = true,
                nounlock = true,
                numtogive = qty,
                atlas = "images/slotm_inventory.xml",
                product = "dubloon",
            }, {"DUBLOONREFINE"})
            if data.sortkey then
                recipe.sortkey = data.sortkey
            end
            r = r + 1
        end
    end
    -- 添加Wilson的转换配方（如果需要）
    AddCharacterRecipe("transmute_dubloons", {Ingredient("goldnugget", math.floor(8 / TUNING.SLOTMACHINE_MODCONFIGDATA["Difficulty"]^0.5 + 0.5))}, TECH.NONE, {
        product = "dubloon",
        image = "dubloon.tex",
        builder_tag = "ore_alchemistII",
        description = "transmute_dubloons",
        numtogive = 1
    })
    r = r + 1
    print("金币精炼配方数: " .. r)
end
local function AddDubloonRefine(refineConfig)
    InitNewShopFilterForRefine()
    AddDubloonRecipesFromConfig(refineConfig)
end
if TUNING.SLOTMACHINE_MODCONFIGDATA["Refine"] then
    AddDubloonRefine(dubloonrefine)
end
-- --------------------------------------------金币精炼结束-----------------------------------------