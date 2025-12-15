Tabs.Visuals = Window:AddTab('Visuals')

local MAIN_BOX = Tabs.Visuals:AddLeftGroupbox('Main')
local PLAYERS_BOX = Tabs.Visuals:AddRightGroupbox('Players')

task.wait()

ESPLibrary = loadstring(game:HttpGet(REPO.LIBRARY .. "ESP.lua"))()

MAIN_BOX:AddDivider()
MAIN_BOX:AddToggle('ESP_ENABLED', {
	Text = 'Enabled ESP',
	Default = false,
    Callback = function(value)
        ESPLibrary.enable(value)
    end,
})
MAIN_BOX:AddDivider()
MAIN_BOX:AddToggle('ESP_BOX_TOGGLE', {
	Text = 'Box ESP',
	Default = false,
    Callback = function(value)
        ESPLibrary.box.enabled = value
    end,
}):AddColorPicker('ESP_BOX_FILLED', {
	Default = Color3.new(1,1,1),
	Title = 'Filled',

	Callback = function(Value, Transparency)
		ESPLibrary.box.fill = Value
	end
}):AddColorPicker('ESP_BOX_OUTLINE', {
	Default = Color3.new(0,0,0),
	Title = 'Outline',

	Callback = function(Value, Transparency)
        ESPLibrary.box.outline = Value
	end
})
MAIN_BOX:AddDropdown('ESP_BOX_TYPE', {
	Values = { "normal", "corner" },
	Default = 1,
	Multi = false, 
	Text = 'Types',
	Callback = function(Value)
        ESPLibrary.box.type = Value
	end,
})
MAIN_BOX:AddSlider('ESP_BOX_PADDING', {
	Text = 'Padding',
	Default = 1.15,
	Min = 0,
	Max = 10,
	Rounding = 2,
})
MAIN_BOX:AddDivider()
MAIN_BOX:AddToggle('ESP_DISTANCE_TOGGLE', {
	Text = 'Show Distance',
	Default = false,
    Callback = function(value)
        ESPLibrary.distnace.enabled = value
    end,
}):AddColorPicker('ESP_DISTANCE_FILL', {
    Default = Color3.new(1,1,1),
    Title = 'Fill',

    Callback = function(Value, Transparency)
        ESPLibrary.distance.fill = Value
    end
})
MAIN_BOX:AddSlider('ESP_DISTANCE_TEXT_SIZE', {
    Text = 'Text Size',
    Default = 13,
    Min = 1,
    Max = 50,
    Rounding = 0,
})
MAIN_BOX:AddDivider()
MAIN_BOX:AddToggle('ESP_TRACER_TOGGLE', {
	Text = 'Show Tracers',
	Default = false,
    Callback = function(value)
        ESPLibrary.tracer.enabled = value
    end,
}):AddColorPicker('ESP_TRACER_FILL', {
    Default = Color3.new(1,1,1),
    Title = 'Fill',

    Callback = function(Value, Transparency)
        ESPLibrary.tracer.fill = Value
    end
}):AddColorPicker('ESP_TRACER_OUTLINE', {
    Default = Color3.new(0,0,0),
    Title = 'Outline',

    Callback = function(Value, Transparency)
        ESPLibrary.tracer.outline = Value
    end
})
MAIN_BOX:AddDropdown('ESP_TRACER_FROM', {
    Values = { "Mouse", "Head", "Top", "Bottom", "Center" },
    Default = 4,
    Multi = false, 
    Text = 'From',
    Callback = function(Value)
        ESPLibrary.tracer.from = Value
    end,
})

PLAYERS_BOX:AddDivider()
PLAYERS_BOX:AddToggle('ESP_NAME_TOGGLE', {
    Text = 'Name ESP',
    Default = false,
    Callback = function(value)
        ESPLibrary.name.enabled = value
    end,
}):AddColorPicker('ESP_NAME_FILL', {
    Default = Color3.new(1,1,1),
    Title = 'Fill',

    Callback = function(Value, Transparency)
        ESPLibrary.name.fill = Value
    end
})
PLAYERS_BOX:AddSlider('ESP_NAME_TEXT_SIZE', {
	Text = 'Text Size',
	Default = 13,
	Min = 1,
	Max = 50,
	Rounding = 0,
})
PLAYERS_BOX:AddDivider()
PLAYERS_BOX:AddToggle('ESP_HEALTH_TOGGLE', {
    Text = 'Health ESP',
    Default = false,
    Callback = function(value)
        ESPLibrary.health.enabled = value
    end,
}):AddColorPicker('ESP_HEALTH_FILL', {
    Default = Color3.new(0,1,0),
    Title = 'Fill',

    Callback = function(Value, Transparency)
        ESPLibrary.health.fill = Value
    end
}):AddColorPicker('ESP_HEALTH_OUTLINE', {
    Default = Color3.new(0,0,0),
    Title = 'Outline',

    Callback = function(Value, Transparency)
        ESPLibrary.health.outline = Value
    end
})