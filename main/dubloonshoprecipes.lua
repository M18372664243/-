local dubloonshop = require "dubloonshoptable"
-- --------------------------------------------金币商店开始-----------------------------------------
local function InitNewShopFilterForShop()
    AddRecipeFilter({name="DUBLOONSHOP",atlas="images/dubloons.xml",image="dubloons.tex"}) --
end

-- 定义一个函数来根据配置添加配方
local function AddDubloonShopFromConfig(config)
    local diff = TUNING.SLOTMACHINE_MODCONFIGDATA["Difficulty"]
    local magnificationLowerLimit = TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationLowerLimit"]
    local magnificationUpperLimit = TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationUpperLimit"]
    local r = 2  -- 配方计数
    AddRecipe2("ohcoin10",
            {Ingredient("dubloon", math.floor(10), "images/slotm_inventory.xml")},
            TUNING.SLOTMACHINE_MODCONFIGDATA["ShopScience"],
            {nil, nil, nounlock = true, numtogive = 1, nil, atlas = "images/ohcoin10.xml", nil, nil, product = "ohcoin10", nil, nil, nil},
            {"DUBLOONSHOP"}) -- 10连币
    AddRecipe2("ohcoinrandom",
            {Ingredient("dubloon", math.floor((magnificationLowerLimit + magnificationUpperLimit)/2), "images/slotm_inventory.xml")},
            TUNING.SLOTMACHINE_MODCONFIGDATA["ShopScience"],
            {nil, nil, nounlock = true, numtogive = 1, nil, atlas = "images/ohcoinrandom.xml", nil, nil, product = "ohcoinrandom", nil, nil, nil},
            {"DUBLOONSHOP"}) -- 随机币
    for _, data in ipairs(config) do
        local cost = data.cost
        local qty = data.qty or 1  -- 如果未指定数量，则默认为1
        local tech = data.tech or TUNING.SLOTMACHINE_MODCONFIGDATA["ShopScience"] or TECH.NONE
        if data.tag == nil
                or (data.tag and not table.contains(data.tag, "Island"))
                or (data.tag and table.contains(data.tag, "Island") and TUNING.SLOTMACHINE_MODCONFIGDATA["workshop-1467214795".."_enable"]) then
            r = r + 1
            AddRecipe2(data.item .. "2",
                    {Ingredient("dubloon", math.floor(cost*diff^0.5+0.5), "images/slotm_inventory.xml")},
                    tech,
                    {nil, nil, nounlock = true, numtogive = qty, nil, nil, nil, nil, product = data.item, nil, nil, nil},
                    {"DUBLOONSHOP"})
        end
    end
    print("金币商店配方数: " .. r)
end
local function AddDubloonShop(shopConfig)
    InitNewShopFilterForShop()
    AddDubloonShopFromConfig(shopConfig)
end
if TUNING.SLOTMACHINE_MODCONFIGDATA["Shop"] then
    AddDubloonShop(dubloonshop)
end
-- --------------------------------------------金币商店结束-----------------------------------------