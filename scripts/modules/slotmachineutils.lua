local slotmachineutils = {}
-- ----------------------------------------------堆叠开始------------------------------------
local function AnimPut(item, target)
    if
    target and target ~= item and target.prefab == item.prefab and item.components.stackable and
            not item.components.stackable:IsFull() and
            target.components.stackable and
            not target.components.stackable:IsFull()
    then
        local start_fx = SpawnPrefab("small_puff")
        start_fx.Transform:SetPosition(target.Transform:GetWorldPosition())
        start_fx.Transform:SetScale(.5, .5, .5)

        item.components.stackable:Put(target)
    end
end
-- 自动堆叠函数(位置，堆叠目标物，堆叠检测半径) 2020.02.16
function slotmachineutils.auto_stack_fn(pt, stackbase, radius)
    if TUNING.SLOTMACHINE_MODCONFIGDATA["AutoStack"] then
        local x, y, z = pt:Get()
        local ents = TheSim:FindEntities(
                x,
                y,
                z,
                radius or 8,
                { "_inventoryitem" },
                { "INLIMBO", "NOCLICK", "catchable", "fire", "bee" }
        )

        if stackbase == nil then
            -- 如果没指定堆叠的目标物则从检测到的物品中选择目标
            local count = #ents
            if count == 0 then
                return
            end

            for i = 1, count do
                local objBase = ents[i]
                if objBase:IsValid() and objBase.components.stackable and
                        not objBase.components.stackable:IsFull()
                then
                    for j = i + 1, count do
                        local obj = ents[j]
                        if obj:IsValid() then
                            AnimPut(objBase, obj)
                        end
                    end
                end
            end

        else
            -- 指定了目标(最好是指定了目标，不然周围无关的东西也会一起堆叠)
            for _, obj in pairs(ents) do
                AnimPut(stackbase, obj)
            end
        end
    end
end
-- ----------------------------------------------堆叠结束------------------------------------
-- 公告
function slotmachineutils.announceFuc(template, playerDisplayName, itemName, magnificationString, formatArgs)
    -- 设置默认模板
    template = template or STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.NORMAL_BASE_TEMPLATE

    -- 准备格式化所需的所有参数
    local allFormatArgs = {playerDisplayName, itemName}
    if formatArgs and #formatArgs > 0 then
        -- 将formatArgs中的元素添加到allFormatArgs中
        for _, v in ipairs(formatArgs) do
            table.insert(allFormatArgs, v)
        end
    end

    -- 检查allFormatArgs中的参数数量是否与模板中的占位符数量匹配
    -- 创建一个模式来匹配所有可能的占位符
    local placeholderPattern = "%%[%dfosxucq]"

    -- 使用 gsub 来替换所有占位符，并通过替换次数来计数
    local count = 0
    template:gsub(placeholderPattern, function() count = count + 1 end)
    if #allFormatArgs ~= count then
        print("Error: The number of arguments does not match the number of placeholders in the template.")
        print(template)
        for _, v in ipairs(allFormatArgs) do
            print(v)
        end
        return
    end

    local announcement = string.format(template, unpack(allFormatArgs))

    -- 添加放大字符串
    if magnificationString then
        announcement = announcement .. magnificationString
    end

    -- 广播公告
    TheNet:Announce(announcement)
end

local function FXSpawn(fx, master)		--FX master function
    local x, y, z = master.Transform:GetWorldPosition()
    local ent = SpawnPrefab(fx)
    ent.Transform:SetPosition(x,y,z)
end


function slotmachineutils.cleanUp(pos, cleanRadius)
    if cleanRadius ~= nil then
        cleanRadius = cleanRadius > 2500 and 2500 or cleanRadius
        if cleanRadius < 1 then
            cleanRadius = nil
        end
    end
    local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, cleanRadius or 8)
    if ents then
        for k,v in pairs(ents) do
            if v.components.inventoryitem
                    and v.components.inventoryitem.owner == nil
                    and v.prefab ~= "chester_eyebone"
                    and v.prefab ~= "glommerflower"
                    and v.prefab ~= "hutch_fishbowl"
                    and v.prefab ~= "moonrockseed"
                    and v.prefab ~= "moon_altar_glass"
                    and v.prefab ~= "moon_altar_idol"
                    and v.prefab ~= "moon_altar_seed"
                    and v.prefab ~= "moon_altar_icon"
                    and v.prefab ~= "moon_altar_crown"
                    and v.prefab ~= "moon_altar_ward"
                    and v.prefab ~= "dubloon"
                    and v.prefab ~= "ohcoin10"
                    and v.prefab ~= "ohcoinrandom"
                    and v.prefab ~= "sculpture_rooknose"
                    and v.prefab ~= "sculpture_knighthead"
                    and v.prefab ~= "sculpture_bishophead"
                    or v.prefab == "skeleton_player"  --骨头
                    or (v.prefab == "daywalker" and v.defeated == true)
                    or (v.prefab == "daywalker2" and v.defeated == true)
                    or v.prefab == "minotaurchest"
            then
                if v.components.inventory then v.components.inventory:DropEverything() end
                if v.components.container then v.components.container:DropEverything() end
                if v.components.inventoryitem ~= nil and v.components.health == nil and v.components.locomotor == nil then
                    FXSpawn("small_puff", v)
                else
                    FXSpawn("shadow_puff_large_front", v)
                    FXSpawn("shadow_puff_large_back", v)
                    FXSpawn("willow_shadow_fire_explode", v)
                end
                v:Remove()
            end
        end
    end
end

return slotmachineutils