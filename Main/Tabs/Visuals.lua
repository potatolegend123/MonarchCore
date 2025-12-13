Tabs.Visuals = Window:AddTab('Visuals')

ESPLibrary = loadstring(game:HttpGet(REPO.LIBRARY .. "ESP.lua"))()

ESPLibrary.teamSettings.enemy.enabled = true
ESPLibrary.teamSettings.enemy.box = true
ESPLibrary.teamSettings.enemy.boxColor[1] = Color3.new(0, 0.25, 0.75)

ESPLibrary.Load()