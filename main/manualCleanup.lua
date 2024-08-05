local slotmachineutils = require "modules.slotmachineutils"
local machineclean = TUNING.SLOTMACHINE_MODCONFIGDATA["MachineClean"] --自动清理
local cleaningscope = TUNING.SLOTMACHINE_MODCONFIGDATA["CleaningScope"] --清理范围
local function splitStringIntoWords(message)
    -- 检查字符串是否为空或nil
    if not message or message == "" then
        return {} -- 返回一个空表
    end

    local words = {} -- 用于存储分割出来的单词
    -- 使用正则表达式匹配非空白字符序列
    for word in string.gmatch(message, "[%S]+") do
        table.insert(words, word)
    end

    return words
end

local OldNetworking_Say = _G.Networking_Say
_G.Networking_Say = function(guid, userid, name, prefab, message, colour, whisper, isemote)
    OldNetworking_Say(guid, userid, name, prefab, message, colour, whisper, isemote)
    local talker = UserToPlayer(userid)
    if machineclean then
        if talker ~= nil and message ~= nil then
            local words = splitStringIntoWords(message)
            if words[1] and words[1] == "#cleanup" or  string.lower(words[1]) == "#cleanup" then
                local cleanupRadius = cleaningscope
                if TheNet:GetIsServerAdmin() and talker.components and talker.Network:IsServerAdmin() and words[2] and tonumber(words[2]) then
                    cleanupRadius = tonumber(words[2])
                end
                local pos = talker:GetPosition()
                local slotMachines = TheSim:FindEntities(pos.x, pos.y, pos.z, 15, { "slotmachine", "structure" })
                if slotMachines and GetTableSize(slotMachines) > 0 then
                    talker.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.CLEANUP_IN_PROGRESS)
                    for k, v in pairs(slotMachines) do
                        if v then
                            local slotmachinepos = v:GetPosition()
                            local inst = SpawnPrefab("abigailsummonfx_mount", "abigailsummonfx_mount", nil)
                            inst.Transform:SetPosition(slotmachinepos.x, slotmachinepos.y, slotmachinepos.z)
                            slotmachineutils.cleanUp(slotmachinepos, cleanupRadius)
                        end
                    end
                else
                    talker.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.NEED_A_SWEEPER)
                end
            end
        end
    else
        talker.components.talker:Say(STRINGS.SLOTMACHINE_ANNOUNCE_TEXT.CLEANUP_NOT_ENABLED)
    end
end