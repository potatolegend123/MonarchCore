--[[

SECURITY NOTICE:
Be careful using a global variables for vulnerable data and scripts. (Others can easily access it!; use local variables)

]]
repeat wait() until game:IsLoaded()

local REPO = "https://raw.githubusercontent.com/potatolegend123/MonarchCore/refs/heads/main/"
local REPO_UTILITY = REPO .. "Utility/"
local REPO_MAIN = REPO .. "Main/"

local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

local UNIVERSE_ID = HttpService:JSONDecode(
	request({
		Url = `https://apis.roblox.com/universes/v1/places/{game.PlaceId}/universe`,
		Method = "GET"
	}).Body
).universeId

local GAME_INFO = HttpService:JSONDecode(
	request({
		Url = REPO_UTILITY .. `Lists.json`, 
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

loadstring(game:HttpGet(REPO_MAIN .. "Main.lua"))()