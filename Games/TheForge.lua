-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
Tabs.Main = Window:AddTab('Main')

local MAIN_BOX = Tabs.Main:AddLeftGroupbox('Groupbox')

LeftGroupBox:AddToggle('MyToggle', {
	Text = 'This is a toggle',
	Tooltip = 'This is a tooltip', -- Information shown when you hover over the toggle
	DisabledTooltip = 'I am disabled!', -- Information shown when you hover over the toggle while it's disabled

	Default = true, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.RiskColor) (Default value = false)

	Callback = function(Value)
		print('[cb] MyToggle changed to:', Value)
	end
})


Toggles.MyToggle:OnChanged(function()
	-- here we get our toggle object & then get its value
	print('MyToggle changed to:', Toggles.MyToggle.Value)
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.MyToggle:SetValue(false)