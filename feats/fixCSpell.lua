
local addonName, lib = ...;

local _G = _G

local function _GetSpellInfo(spellID)
    return C_SpellBook.GetSpellInfo(spellID)
end
    
-- Doney Mod -->>
local function fixCSpell()
    -- Ensure C_Spell exists
    if _G.C_Spell == nil then
        lib.LOGD("Creating C_Spell table ...")
        _G.C_Spell = {}
    end
    
    lib.ensureFunction(C_Spell, "GetSpellCooldown", GetSpellCooldown)
    lib.ensureFunction(C_Spell, "GetSpellInfo", GetSpellInfo, _GetSpellInfo)
end

fixCSpell()