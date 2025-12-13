local REPO = "https://raw.githubusercontent.com/potatolegend123/MonarchCore/refs/heads/main/"
local REPO_UTILITY = REPO .. "Utility/"
local REPO_GAMES = REPO .. "Games/"
local REPO_LIBRARY = REPO .. "Library/"
local REPO_DEBUG = REPO .. "Debug/"
local REPO_MAIN = REPO .. "Main/"

loadstring(game:HttpGet(REPO_UTILITY .. "Services.lua"))()

Trove = loadstring(game:HttpGet(REPO_UTILITY .. "Trove.lua"))()

loadstring(game:HttpGet(REPO_UTILITY .. "Player.lua"))()
loadstring(game:HttpGet(REPO_UTILITY .. "Essentials.lua"))()

GAME_NAME = GAME_INFO.name

loadstring(game:HttpGet(REPO_MAIN .. "Top.lua"))()
loadstring(game:HttpGet(REPO_GAMES .. GAME_INFO.link))()
loadstring(game:HttpGet(REPO_MAIN .. "Bottom.lua"))()

GAME_NAME = nil