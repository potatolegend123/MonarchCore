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

Tabs.Admin:AddButton({
	Text = 'Dex++',
	Func = function()
		loadstring(game:HttpGet(REPO.DEBUG .. "Dex++.lua"))()
	end,
})

Tabs.Admin:AddButton({
	Text = 'Simple Remote Spy',
	Func = function()
		loadstring(game:HttpGet(REPO.DEBUG .. "SimpleRemoteSpy.lua"))()
	end,
})