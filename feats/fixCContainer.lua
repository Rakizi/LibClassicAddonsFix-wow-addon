local addonName, lib = ...;

local _G = _G

local function fixCContainer()
    -- Ensure C_Container exists
    if _G.C_Container == nil then
        lib.LOGD("Creating C_Container table ...")
        _G.C_Container = {}
    end
    
    lib.ensureFunction(C_Container, "GetItemCooldown", GetItemCooldown)

end

fixCContainer()
