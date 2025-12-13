--[[

SECURITY NOTICE:
Be careful using a global variables for vulnerable data and scripts. (Others can easily access it!; use local variables)

]]
repeat wait() until game:IsLoaded()

local URL = "https://raw.githubusercontent.com/potatolegend123/MonarchCore/main/"
REPO = {
	UTILITY = URL .. "Utility/",
	GAMES = URL .. "Games/",
	LIBRARY = URL .. "Library/",
	DEBUG = URL .. "Debug/",
	MAIN = URL .. "Main/",
	TABS = URL .. "Main/Tabs/",
}

local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

local UNIVERSE_ID = HttpService:JSONDecode(
	request({
		Url = `https://apis.roblox.com/universes/v1/places/{game.PlaceId}/universe`,
		Method = "GET"
	}).Body
).universeId

GAME_INFO = HttpService:JSONDecode(
	request({
		Url = REPO.UTILITY .. `Lists.json`, 
		Method = "GET"
	}).Body
)[tostring(UNIVERSE_ID)]

if GAME_INFO == nil then
	StarterGui:SetCore("SendNotification", {
	    Title = "Monarch Core",
	    Text = "This game is unsupported!",
	    Icon = "rbxassetid://80671702471223",
	    Duration = 10
	})
	return 
end

GAME_NAME = GAME_INFO.name

loadstring(game:HttpGet(REPO.MAIN .. "Main.lua"))()