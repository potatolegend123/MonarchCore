-- load Trove for easier clean up (prevent memory leaks)
Trove = loadstring(game:HttpGet(REPO.UTILITY .. "Trove.lua"))()
Troves = {}
Troves.Global = Trove.new()

PlaceId = game.PlaceId
TimeExecuted = os.time()

TextModule = loadstring(game:HttpGet(REPO.UTILITY .. "TextModule.lua"))()

-- load services for easier access: GetService("ServiceName")
loadstring(game:HttpGet(REPO.UTILITY .. "Services.lua"))()

-- load essentials functions to use throughout the script
loadstring(game:HttpGet(REPO.UTILITY .. "Essentials.lua"))()
loadstring(game:HttpGet(REPO.UTILITY .. "Player.lua"))() -- Player & Character related functions

-- CODES BELOW WILL NOT RUN UNTIL THE PLAYER'S CHARACTER HAS LOADED: CharacterAdded:Wait()

-- load the main tabs and libraries
loadstring(game:HttpGet(REPO.MAIN .. "Top.lua"))()

--load the game tabs
loadstring(game:HttpGet(REPO.GAMES .. GAME_INFO.link))()

-- load the universal tabs
loadstring(game:HttpGet(REPO.TABS .. "Visuals.lua"))()
loadstring(game:HttpGet(REPO.TABS .. "Misc.lua"))()
loadstring(game:HttpGet(REPO.TABS .. "Admin.lua"))()

-- load final tabs and configurations
loadstring(game:HttpGet(REPO.MAIN .. "Bottom.lua"))()

REPO = nil