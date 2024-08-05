-- 给予每个玩家初始金币
--Function to give a starting amount of dubloons for each player on spawn
local start = TUNING.SLOTMACHINE_MODCONFIGDATA["Starting"]
local OnPlayerSpawn = function(src, player)
    player.prev_OnNewSpawn = player.OnNewSpawn
    player.OnNewSpawn = function()
        local freebie = {}
        if start >= 1 then
            for i = 1, start do
                table.insert(freebie, "dubloon")
            end
        end
        player:DoTaskInTime(0, function(inst)
            for k,v in pairs(freebie) do
                local item = SpawnPrefab(v)
                player.components.inventory:GiveItem(item)
            end
        end)

        if player.prev_OnNewSpawn ~= nil then
            player:prev_OnNewSpawn()
            player.prev_OnNewSpawn = nil
        end
    end
    local portal = TheSim:FindFirstEntityWithTag("multiplayer_portal")	--New part
    for k, v in pairs(AllPlayers) do				--Checking all players in the world (if I can find a better event, I'd use it but eh this one already exists)
        if v.userid ~= nil and portal ~= nil and portal.playerslotsave ~= nil and portal.playerslotsave[v.userid] ~= nil then
            local playerslotsave = portal.playerslotsave[v.userid]			--{inst.taxdebt, inst.routinewealth, inst.wealthchecks, inst.totaldayspaid, inst.consdayspaid, inst.consdaysskipped, inst.skippeddays}
            v.slotrolls = playerslotsave[1]
            portal.playerslotsave[v.userid] = nil 	--Clearing the saved data upon respawning back into the world so this isn't saved / applied every time they rejoin.在重新生成世界时清除保存的数据，这样就不会在每次重新加入时保存/应用这些数据。
        end
    end
end

local function ListenForPlayers(inst)
    if TheWorld.ismastersim then
        inst:ListenForEvent("ms_playerspawn", OnPlayerSpawn)
    end
end

AddPrefabPostInit("world", ListenForPlayers)