
local addonName, lib = ...;

local _G = _G

-- Doney Mod -->>
local function fixCSpellBook()
    -- Ensure C_SpellBook exists
    if _G.C_SpellBook == nil then
        lib.LOGD("Creating C_SpellBook table ...")
        _G.C_SpellBook = {}
    end

    lib.ensureFunction(C_SpellBook, "GetNumSpellBookSkillLines", GetNumSkillLines)
    lib.ensureFunction(C_SpellBook, "GetSpellBookItemInfo", GetSpellBookItemInfo)
    lib.ensureFunction(C_SpellBook, "GetSpellBookSkillLineInfo", GetSpellBookSkillLineInfo)


end

fixCSpellBook()