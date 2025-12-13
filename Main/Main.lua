getgenv().GetService = function(service: string)
    return game:GetService(service)
end

HttpService = GetService("HttpService")
ReplicatedStorage = GetService("ReplicatedStorage")
RunService = GetService("RunService")
Players = GetService("Players")
MarketplaceService = GetService("MarketplaceService")
TweenService = GetService("TweenService")
CollectionService = GetService("CollectionService")
ReplicatedFirst = GetService("ReplicatedFirst")
TeleportService = GetService("TeleportService")
UserInputService = GetService("UserInputService")
SoundService = GetService("SoundService")
ProximityPromptService = GetService("ProximityPromptService")
GroupService = GetService("GroupService")
ContextActionService = GetService("ContextActionService")
StatsService = GetService("Stats")
StarterGui = GetService("StarterGui")

UNIVERSE_ID = HttpService:JSONDecode(
	request({
		Url = `https://apis.roblox.com/universes/v1/places/{game.PlaceId}/universe`,
		Method = "GET"
	}).Body
).universeId

REPO = "https://raw.githubusercontent.com/potatolegend123/MonarchCore/refs/heads/main/"
REPO_UTILITY = REPO .. "Utility/"
REPO_GAMES = REPO .. "Games/"
REPO_LIBRARY = REPO .. "Library/"
REPO_DEBUG = REPO .. "Debug/"
REPO_MAIN = REPO .. "Main/"

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

GAME_NAME = GAME_INFO.name

loadstring(game:HttpGet(REPO .. "Main/Top.lua"))()
loadstring(game:HttpGet(REPO_GAMES .. GAME_INFO.link))()
loadstring(game:HttpGet(REPO .. "Main/Bottom.lua"))()
