local _, lib = ...;

local _G = _G

-- Doney Mod -->>

-- Custom fallback function to use if GetAddOnEnableState doesn't exist
local function g_GetAddOnEnableState(char, addon)
    return C_AddOns.GetAddOnEnableState(char, addon)
end

-- Fallback implementation for GetAddOnEnableState
local function _GetAddOnEnableState(arg1, arg2)
    local char = arg1
    local addon = arg2
    if arg2 == nil then
        -- Handle cases where only the addon name is passed
        char = UnitName("player")
        addon = arg1
    end
    if arg2 == UnitName("player") then
        char = arg2
        addon = arg1
    end
    return g_GetAddOnEnableState(char, addon)
end

-- Function to fix or add missing C_AddOns functions
local function fixCAddons()
    -- Ensure C_AddOns exists
    if _G.C_AddOns == nil then
        lib.LOGD("Creating C_AddOns table ...")
        _G.C_AddOns = {}
    end

    -- Ensure functions exist in both global space and C_AddOns namespace, with fallback to custom implementations
    lib.ensureFunction(C_AddOns, "IsAddOnLoaded", IsAddOnLoaded)
    lib.ensureFunction(C_AddOns, "DoesAddOnExist", DoesAddOnExist)
    lib.ensureFunction(C_AddOns, "DisableAddOn", DisableAddOn)
    lib.ensureFunction(C_AddOns, "EnableAddOn", EnableAddOn)
    lib.ensureFunction(C_AddOns, "GetAddOnInfo", GetAddOnInfo)
    lib.ensureFunction(C_AddOns, "GetAddOnMetadata", GetAddOnMetadata)
    lib.ensureFunction(C_AddOns, "GetNumAddOns", GetNumAddOns)
    lib.ensureFunction(C_AddOns, "LoadAddOn", LoadAddOn)
    
    -- Use custom fallback for GetAddOnEnableState if neither function exists
    lib.ensureFunction(C_AddOns, "GetAddOnEnableState", GetAddOnEnableState, _GetAddOnEnableState)
end

fixCAddons()
-- Doney Mod <<--
