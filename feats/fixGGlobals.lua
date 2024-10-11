local addonName, lib = ...;
local _G = _G

-- GetSpecialization for Cata/Classic
local function GetSpecialization()
    return _G.GetPrimaryTalentTree() -- Cata equivalent
end

-- GetSpecializationInfo for Cata
local function GetSpecializationInfo(specIndex)
    if specIndex then
    	local role = GetTalentTreeRoles(specIndex)
        local specID, specName, description, icon = _G.GetTalentTabInfo(specIndex)
        return specID, specName, description, icon, role
    else 
        return nil,nil,nil,nil,nil

    end
end


-- Register missing global functions for Classic/Cata
local function registerMissingGlobalFunctions()
    local globalFunctionsToRegister = {
        GetSpecialization = GetSpecialization,
        GetSpecializationInfo = GetSpecializationInfo,
    }

    for funcName, func in pairs(globalFunctionsToRegister) do
        if _G[funcName] == nil then
            _G[funcName] = func
            lib.LOGD("Added global function " .. funcName .. " for Classic/Cata")
        else
            lib.LOGD(funcName .. " already exists, skipping")
        end
    end
end

-- Call to register missing global functions
registerMissingGlobalFunctions()
