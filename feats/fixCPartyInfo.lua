
local addonName, lib = ...;

local _G = _G

-- Doney Mod -->>
local function fixCPartyInfo()
    -- Ensure C_PartyInfo exists
    if _G.C_PartyInfo == nil then
        lib.LOGD("Creating C_PartyInfo table ...")
        _G.C_PartyInfo = {}
    end
    lib.ensureFunction(C_PartyInfo, "IsDelveInProgress", IsDelveInProgress, function() return false end)

end

fixCPartyInfo()