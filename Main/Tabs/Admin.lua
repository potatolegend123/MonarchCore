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

Tabs.Admin = Window:AddTab('Admin')
local AdminBox = Tabs.Admin:AddLeftGroupbox('Debug Tools')

task.wait()
AdminBox:AddButton("Dex++", function() loadstring(game:HttpGet(REPO.DEBUG .. "Dex++.lua"))() end)
AdminBox:AddButton("Simple Remote Spy", function() loadstring(game:HttpGet(REPO.DEBUG .. "SimpleRemoteSpy.lua"))() end)