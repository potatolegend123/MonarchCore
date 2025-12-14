Tabs.Visuals = Window:AddTab('Visuals')

local MAIN_BOX = Tabs.Visuals:AddLeftGroupbox('Main')

task.wait(1)

ESPLibrary = loadstring(game:HttpGet(REPO.LIBRARY .. "ESP.lua"))()

MAIN_BOX:AddDivider()
MAIN_BOX:AddToggle('ATTACK_TOGGLE', {
	Text = 'Auto Attack',
	Default = false,
    Callback = function(value)
        if Value == false then return end
        task.spawn(function()
            while Toggles.ATTACK_TOGGLE.Value do
                if Library.Unloaded then break end
                Services.ToolService:ToolActivated("Weapon")
                task.wait(0.1)
            end
        end)
    end,
})