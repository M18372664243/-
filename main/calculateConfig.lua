
-- ----------------------------------------------配置计算开始------------------------------------
local function getClassificationWeightByConfiguration(option)
    local weight = 0
    if option.saved ~= nil then
        weight = option.saved
    else
        weight = option.default
    end
    if weight < 0 then
        weight = 0
    end
    return weight
end

local function getScienceByConfiguration(option)
    local scienceConfigValue = 0
    if option.saved ~= nil then
        scienceConfigValue = option.saved
    else
        scienceConfigValue = option.default
    end
    if scienceConfigValue == nil or  scienceConfigValue == 0 then
        return TECH.NONE
    elseif scienceConfigValue == 1  then
        return TECH.SCIENCE_ONE
    elseif scienceConfigValue == 2  then
        return TECH.SCIENCE_TWO
    elseif scienceConfigValue == 3  then
        return TECH.MAGIC_TWO
    elseif scienceConfigValue == 4  then
        return TECH.MAGIC_THREE
    elseif scienceConfigValue == 5  then
        return TECH.ANCIENT_TWO
    else
        return TECH.NONE
    end
end

local function hasModEnable(modName)
    local hasModEnable = KnownModIndex:IsModEnabled(modName)
    local hasModLoad = TUNING.SLOTMACHINE_MODCONFIGDATA["loadMods"]  and TUNING.SLOTMACHINE_MODCONFIGDATA["loadMods"][modName] or false
    return hasModEnable or hasModLoad
end

local function getModWeightByConfiguration(option)
    local weight = 0
    local modEnable = hasModEnable(option.modName)
    TUNING.SLOTMACHINE_MODCONFIGDATA[option.modName.."_enable"] = modEnable
    if modEnable then
        if option.saved ~= nil then
            weight = option.saved
        else
            weight = option.default
        end
    else
        weight = 0
    end
    if weight < 0 then
        weight = 0
    end
    if modEnable and weight > 0 then
        TUNING.SLOTMACHINE_MODCONFIGDATA[option.modName.."_check"] = true
    end
    return weight
end

local function getNormalByConfiguration(option)
    if option.saved ~= nil then
        return option.saved
    else
        return option.default
    end
end


-- 获取本mod的所有配置数据
local function getCurrentModConfiguration ()
    local config = KnownModIndex:LoadModConfigurationOptions("workshop-3273001012", false)
    TUNING.SLOTMACHINE_MODCONFIGDATA["SlotmachineConfigs"] = config
    return config
end


local function getAllModLoadedState ()
    local loadMods = {}
    for _, v in pairs(KnownModIndex:GetModsToLoad()) do
        loadMods[v] = true
    end
    TUNING.SLOTMACHINE_MODCONFIGDATA["loadMods"] = loadMods
    return loadMods
end

local function calculateModConfiguration (config)
    if config and type(config) == "table" then
        -- 分类标签的数值定义
        local prize_values = {}
        local classify_values = {}
        local mod_values = {}
        for i,v in pairs(config) do
            if v.tag == "CategoryWeight" or v.tag == "SubclassWeight" then
                local temp = getClassificationWeightByConfiguration(v)
                TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] = temp
                if v.tag == "CategoryWeight" then
                    prize_values[v.name] =  temp
                end
                if v.tag == "SubclassWeight" then
                    classify_values[v.name] =  temp
                end
            elseif  v.tag == "Science" then
                TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] = getScienceByConfiguration(v)
            elseif  v.tag == "Mod" then
                local temp = getModWeightByConfiguration(v)
                TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] = temp
                mod_values[v.name]  =  temp
            else
                TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] = getNormalByConfiguration(v)
                if v.name == "Difficulty" then
                    if TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] <= 0.03  or TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] > 50 then
                        TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] = 1
                    end
                elseif v.name == "Starting" then
                    local Starting = math.floor(TUNING.SLOTMACHINE_MODCONFIGDATA[v.name]+0.5)
                    if Starting > 500 then
                        Starting = 500
                    end
                    TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] = Starting
                elseif v.name == "MagnificationLowerLimit" or v.name == "MagnificationUpperLimit" then
                    if TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] < 1 then
                        TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] = 1
                    else
                        TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] = math.floor(TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] + 0.5)  -- 四舍五入到最接近的正整数
                    end
                elseif v.name == "SlotMachineDifficulty" then
                    local SlotMachineDifficulty = math.floor(TUNING.SLOTMACHINE_MODCONFIGDATA[v.name]+0.5)
                    if SlotMachineDifficulty > 5 then
                        SlotMachineDifficulty = 5
                    end
                    if SlotMachineDifficulty < 1 then
                        SlotMachineDifficulty = 1
                    end
                    TUNING.SLOTMACHINE_MODCONFIGDATA[v.name] = SlotMachineDifficulty
                end
            end
            print(v.name, v.saved, v.default)
        end
        --大分类权重表
        TUNING.SLOTMACHINE_MODCONFIGDATA["PrizeValues"] = prize_values
        --小分类权重表
        TUNING.SLOTMACHINE_MODCONFIGDATA["ClassifyValues"] = classify_values
        -- 模组物品权重表
        TUNING.SLOTMACHINE_MODCONFIGDATA["ModValues"] = mod_values
        -- 保证最高倍率不低于最低倍率
        if TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationLowerLimit"] > TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationUpperLimit"] then
            TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationLowerLimit"],TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationUpperLimit"] = TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationUpperLimit"],TUNING.SLOTMACHINE_MODCONFIGDATA["MagnificationLowerLimit"]
        end
        --Failsafe against all 0s, sets it to default if triggered（防止抽奖机三种结果比重都为0）
        if TUNING.SLOTMACHINE_MODCONFIGDATA["good"] == 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["ok"] == 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["bad"] == 0 then
            TUNING.SLOTMACHINE_MODCONFIGDATA["good"] = 1
            TUNING.SLOTMACHINE_MODCONFIGDATA["ok"] = 3
            TUNING.SLOTMACHINE_MODCONFIGDATA["bad"] = 2
        end

        --确保每种结果下的比重表中至少有一项（DropDefault）比重不为0
        --Check for the drop weight multipliers (making sure not all the multipliers for any particular type are not all 0)
        if TUNING.SLOTMACHINE_MODCONFIGDATA["DropDefault"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropRarity"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropJackpot"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropEvent"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropTop"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropBoss"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropChar"] and TUNING.SLOTMACHINE_MODCONFIGDATA["DropBook"] <= 0 then
            TUNING.SLOTMACHINE_MODCONFIGDATA["DropDefault"] = 1
        end

        if TUNING.SLOTMACHINE_MODCONFIGDATA["DropDefault"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropRarity"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropFood"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropDish"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropSeed"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropTurf"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropPlant"] <= 0 then
            TUNING.SLOTMACHINE_MODCONFIGDATA["DropDefault"] = 1
        end

        if TUNING.SLOTMACHINE_MODCONFIGDATA["DropDefault"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropEnemy"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropBadBoss"] <= 0 and TUNING.SLOTMACHINE_MODCONFIGDATA["DropEffect"] <= 0 then
            TUNING.SLOTMACHINE_MODCONFIGDATA["DropDefault"] = 1
        end
    end
end

local function printConfiguration()
    if TUNING.SLOTMACHINE_MODCONFIGDATA["logSwitch"] then
        for k, v in pairs(TUNING.SLOTMACHINE_MODCONFIGDATA) do
            print(k, v)
        end
    end
end

-- 获取计算并保存配置
local function getAndCacheConfiguration ()
    -- 定义全局变量
    TUNING.SLOTMACHINE_MODCONFIGDATA = {}
    -- 开启日志
    TUNING.SLOTMACHINE_MODCONFIGDATA["logSwitch"] = true
    -- 获取mod的配置信息保存
    local config = getCurrentModConfiguration()
    -- 获取所有mod是否加载
    local loadMods = getAllModLoadedState()
    -- 计算配置最终数值并保存
    calculateModConfiguration(config)
    printConfiguration()
end
getAndCacheConfiguration ()
-- ----------------------------------------------配置计算结束------------------------------------