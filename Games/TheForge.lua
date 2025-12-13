-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local Knit = require(ReplicatedStorage.Shared.Packages.Knit)
local Controllers = Knit.GetControllers()
local Services = {}

for i, v in ReplicatedStorage.Shared.Packages.Knit.Services:GetChildren() do
    if not v:IsA("Folder") then continue end
    Services[v.Name] = Knit.GetService(v.Name)
end

Tabs.Main = Window:AddTab('Main')

local MAIN_BOX = Tabs.Main:AddLeftGroupbox('Autos')

MAIN_BOX:AddDivider()
MAIN_BOX:AddToggle('ATTACK_TOGGLE', {
	Text = 'Auto Attack',
	Default = true, -- Default value (true / false)
})

Toggles.ATTACK_TOGGLE:OnChanged(function(Value)
	if Value == false then return end
    task.spawn(function()
        while Toggles.ATTACK_TOGGLE.Value do
            Services.ToolService:ToolActivated("Weapon")
            task.wait(0.1)
        end
    end)
end)

MAIN_BOX:AddToggle('PICKAXE_TOGGLE', {
	Text = 'Auto Pickaxe',
	Default = true, -- Default value (true / false)
})

Toggles.PICKAXE_TOGGLE:OnChanged(function(Value)
	if Value == false then return end
    task.spawn(function()
        while Toggles.PICKAXE_TOGGLE.Value do
            Services.ToolService:ToolActivated("Pickaxe")
            task.wait(0.1)
        end
    end)
end)