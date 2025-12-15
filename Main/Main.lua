-- load Trove for easier clean up (prevent memory leaks)

if MONARCHLOADED then
    MONARCHLOADED:Unload()
    MONARCHLOADED = nil
end

Trove = loadstring(game:HttpGet(REPO.UTILITY .. "Trove.lua"))()
Troves = {}
Troves.Global = Trove.new()

JobId = game.JobId
PlaceId = game.PlaceId
TimeExecuted = os.time()

TextModule = loadstring(game:HttpGet(REPO.UTILITY .. "TextModule.lua"))()

-- load services for easier access: GetService("ServiceName")
loadstring(game:HttpGet(REPO.UTILITY .. "Services.lua"))()
task.wait()
-- load essentials functions to use throughout the script
loadstring(game:HttpGet(REPO.UTILITY .. "Essentials.lua"))()
task.wait()
loadstring(game:HttpGet(REPO.UTILITY .. "Player.lua"))() -- Player & Character related functions
task.wait()
-- CODES BELOW WILL NOT RUN UNTIL THE PLAYER'S CHARACTER HAS LOADED: CharacterAdded:Wait()

-- load the main tabs and libraries
loadstring(game:HttpGet(REPO.MAIN .. "Top.lua"))()

task.wait(1)

--load the game tabs
loadstring(game:HttpGet(REPO.GAMES .. GAME_INFO.link))()
task.wait()
-- load the universal tabs
loadstring(game:HttpGet(REPO.TABS .. "Visuals.lua"))()
task.wait()
loadstring(game:HttpGet(REPO.TABS .. "Misc.lua"))()
task.wait()
loadstring(game:HttpGet(REPO.TABS .. "Admin.lua"))()
task.wait()

-- load final tabs and configurations
loadstring(game:HttpGet(REPO.MAIN .. "Bottom.lua"))()
task.wait()

REPO = nil