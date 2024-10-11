local _, lib = ...;
local _G = _G

-- Define fallback function for UnitAura
local function _GetAuraDataByIndex(unit, index, filter)
    return UnitAura(unit, index, filter)
end

-- Register missing functions for C_UnitAuras
local function fixCUnit()
    -- Ensure C_SpellBook exists
    if _G.C_UnitAuras == nil then
        lib.LOGD("Creating C_SpellBook table ...")
        _G.C_UnitAuras = {}
    end

    lib.ensureFunction(C_UnitAuras, "GetAuraDataByIndex", GetAuraDataByIndex, _GetAuraDataByIndex)
end

fixCUnit()
