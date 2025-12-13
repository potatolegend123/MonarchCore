local REPO = "https://raw.githubusercontent.com/potatolegend123/MonarchCore/refs/heads/main/"
local REPO_UTILITY = REPO .. "Utility/"
local REPO_GAMES = REPO .. "Games/"
local REPO_LIBRARY = REPO .. "Library/"
local REPO_DEBUG = REPO .. "Debug/"
local REPO_MAIN = REPO .. "Main/"

local ClientID = RbxAnalyticsService:GetClientId()

local WHITELIST = HttpService:JSONDecode(
	request({
		Url = REPO_UTILITY .. "Whitelist.json",
		Method = "GET"
	}).Body
)

if not WHITELIST[tostring(ClientID)] then
    return -- not an authorized user
end

print("Monarch Core: Authorized user detected. Loading script...")