local slotmachineutils = require "modules.slotmachineutils"
AddComponentPostInit("lootdropper", function(LootDropper, inst)
    local old_FlingItem = LootDropper.FlingItem
    function LootDropper:FlingItem(loot, pt)
        old_FlingItem(LootDropper, loot, pt)
        local pos = inst:GetPosition()
        loot:DoTaskInTime(0.5, function() slotmachineutils.auto_stack_fn(pos, loot) end)
    end
end)