local addonName, lib = ...;

local _G = _G

-- Doney Mod -->>
local function fixCItem()
    -- Ensure C_Item exists
    if _G.C_Item == nil then
        lib.LOGD("Creating C_Item table ...")
        _G.C_Item = {}
    end

    lib.ensureFunction(C_Item, "GetItemInfo", GetItemInfo)
    lib.ensureFunction(C_Item, "GetItemClassInfo", GetItemClassInfo)
    lib.ensureFunction(C_Item, "GetItemInfoInstant", GetItemInfoInstant)
    lib.ensureFunction(C_Item, "GetDetailedItemLevelInfo", GetDetailedItemLevelInfo)
    lib.ensureFunction(C_Item, "GetItemSubClassInfo", GetItemSubClassInfo)
    lib.ensureFunction(C_Item, "GetItemInventorySlotInfo", GetItemInventorySlotInfo)
    lib.ensureFunction(C_Item, "GetItemSpell", GetItemSpell)
    lib.ensureFunction(C_Item, "GetItemFamily", GetItemFamily)
    lib.ensureFunction(C_Item, "IsItemInRange", IsItemInRange)
    lib.ensureFunction(C_Item, "GetItemQualityColor", GetItemQualityColor)
    end

fixCItem();
-- Doney Mod <<--
