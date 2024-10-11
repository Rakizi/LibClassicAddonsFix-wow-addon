local addonName, lib = ...;
local _G = _G

local function _GetActiveConfigID()
    -- For Cataclysm and Classic, we do not have talent configs, so we will create a basic approximation
    -- In Cataclysm, we can use GetPrimaryTalentTree() to approximate the active spec

    if _G.GetSpecialization then
        -- If GetSpecialization is available (Retail API), return the specialization
        return _G.GetSpecialization()
    elseif _G.GetPrimaryTalentTree then
        -- For Cataclysm, use GetPrimaryTalentTree which returns the current talent tree (1, 2, or 3)
        local primaryTree = _G.GetPrimaryTalentTree()
        if primaryTree then
            lib.LOGD("Active talent tree: " .. primaryTree)
            return primaryTree -- Return the tree index (1, 2, or 3)
        else
            lib.LOGD("No active talent tree found.")
            return nil
        end
    else
        -- In Classic, talent trees exist but there's no direct equivalent of a config ID
        lib.LOGD("No talent tree system exists for this version.")
        return nil
    end
end

-- Register missing functions for C_ClassTalents
local function fixCClassTalents()
    -- Ensure C_Container exists
    if _G.C_ClassTalents == nil then
        lib.LOGD("Creating C_ClassTalents table ...")
        _G.C_ClassTalents = {}
    end
    
    lib.ensureFunction(C_ClassTalents, "GetActiveConfigID", GetActiveConfigID, _GetActiveConfigID)

end

fixCClassTalents()
