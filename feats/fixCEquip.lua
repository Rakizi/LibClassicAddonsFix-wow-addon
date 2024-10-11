local addonName, lib = ...;

local _G = _G

-- Doney Mod
local function fixCEquip()
    -- Ensure C_EquipmentSet exists
    if _G.C_EquipmentSet == nil then
        lib.LOGD("Creating C_EquipmentSet table ...")
        _G.C_EquipmentSet = {}
    end

    lib.ensureFunction(C_EquipmentSet, "GetNumEquipmentSets", GetNumEquipmentSets)
    lib.ensureFunction(C_EquipmentSet, "GetEquipmentSetInfo", GetEquipmentSetInfo)
end

fixCEquip()
