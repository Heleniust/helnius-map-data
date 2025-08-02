local resourceName = GetCurrentResourceName()
local currentVersion = GetResourceMetadata(resourceName, 'version', 0)

local function checkVersion(_, responseText, _)
    if not responseText then return print("^1Version check failed: ^3The resource name was changed.^0") end
    responseText = string.gsub(responseText, "\n", "")

    if currentVersion ~= responseText then
        print("^1-------------["..resourceName.."]-------------")
        print("^1^3New Version Available: " .. responseText)
        print("^3Current Version: " .. currentVersion)
        print("^1-------------["..resourceName.."]-------------^0")
    end
end
Wait(1001)
PerformHttpRequest("https://raw.githubusercontent.com/Heleniust/helnius-map-versions/refs/heads/main/"..resourceName, checkVersion, "GET")
