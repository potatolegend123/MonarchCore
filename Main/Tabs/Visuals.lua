Tabs.Visuals = Window:AddTab('Visuals')

local MAIN_BOX = Tabs.Visuals:AddLeftGroupbox('Main')

task.wait()

ESPLibrary = loadstring(game:HttpGet(REPO.LIBRARY .. "ESP.lua"))()

MAIN_BOX:AddDivider()
MAIN_BOX:AddToggle('ESP_BOX_TOGGLE', {
	Text = 'Box ESP',
	Default = false,
    Callback = function(value)
        ESPLibrary.box.enabled = value
    end,
})