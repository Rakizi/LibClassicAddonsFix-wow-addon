
local addonName, lib = ...;

local _G = _G

local ENABLE_DEBUG_DONEY = true
local function LOGD(msg)
    if (ENABLE_DEBUG_DONEY) then
        DEFAULT_CHAT_FRAME:AddMessage("[|c4040ffffLibClassicAddonsFix|r/|cffffffffD|r] "..msg);
    end
end
local function LOGW(msg)
    DEFAULT_CHAT_FRAME:AddMessage("[|c4040ffffLibClassicAddonsFix|r/|cb0a040ffW|r] "..msg);
end
local function LOGE(msg)
    DEFAULT_CHAT_FRAME:AddMessage("[|c4040ffffLibClassicAddonsFix|r/|cfff040ffE|r] "..msg);
end
local function toBoolStr(value)
    return value and "true" or "false";
end
local function ensureFunction(namespaceTable, functionName, globalFunction, fallbackFunction)
    -- Check if the function exists in the C_ namespace and link it from the global function if available
    if namespaceTable[functionName] == nil then
        if globalFunction then
            lib.LOGD("Fix for " .. functionName .. " ... assigning from global function")
            namespaceTable[functionName] = globalFunction
        elseif fallbackFunction then
            lib.LOGD("No valid function found for " .. functionName .. ", assigning fallback function")
            namespaceTable[functionName] = fallbackFunction
        else
            lib.LOGD("No valid function or fallback for " .. functionName .. ", assigning nil")
            namespaceTable[functionName] = nil
        end
    elseif globalFunction == nil then
        if fallbackFunction then
            lib.LOGD("Fix for global " .. functionName .. " ... assigning fallback function")
            _G[functionName] = fallbackFunction
        else
            lib.LOGD("Fix for global " .. functionName .. " ... assigning from C_ namespace")
            _G[functionName] = namespaceTable[functionName]
        end
    end
end
lib.ensureFunction = ensureFunction
lib.LOGD = LOGD
lib.LOGW = LOGW
lib.LOGE = LOGE
lib.toBoolStr = toBoolStr
