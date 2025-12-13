local ClientID = game.RbxAnalyticsService:GetClientId()

local WHITELIST = game.HttpService:JSONDecode(
	request({
		Url = REPO.UTILITY .. "Whitelist.json",
		Method = "GET"
	}).Body
)

if not WHITELIST[tostring(ClientID)] then
    return -- not an authorized user
end

print("Monarch Core: Authorized user detected. Loading script...")

Tabs.Admin = Window:AddTab('Admin')