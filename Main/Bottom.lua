-- Library functions
-- Sets the watermark visibility
Library:SetWatermarkVisibility(true)

Tabs.Settings = Window:AddTab('Settings')

-- Example of dynamically-updating watermark with common traits (fps and ping)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;
local GetPing = (function() return math.floor(StatsService.Network.ServerStatsItem['Data Ping']:GetValue()) end)
local CanDoPing = pcall(function() return GetPing(); end)

Troves.Global:Connect(RunService.RenderStepped, function()
	FrameCounter += 1;

	if (tick() - FrameTimer) >= 1 then
		FPS = FrameCounter;
		FrameTimer = tick();
		FrameCounter = 0;
	end;

	if CanDoPing then
		Library:SetWatermark((
			`Monarch Core | {math.floor(FPS)} fps | {GetPing()} ms | Play time: {TextModule:Timer(game.Workspace.DistributedGameTime)} | Script Runtime: {TextModule:Timer(os.time() - TimeExecuted)}`
		));
	else
		Library:SetWatermark((
			`Monarch Core | {math.floor(FPS)} fps | Server Runtime: {TextModule:Timer(game.Workspace.DistributedGameTime)} | Play time: {TextModule:Timer(os.time( ) - TimeExecuted)}`
		));
	end
end);

Library:OnUnload(function()
	ESPLibrary.Unload()
	for i, v in Troves do
		v:Destroy()
		v = nil
	end

	print('Unloaded!')
	Library.Unloaded = true
end)

-- UI Settings
print(Tabs)
print(Tabs.Settings)
local MenuGroup = Tabs.Settings:AddLeftGroupbox('Menu')

MenuGroup:AddToggle("KeybindMenuOpen", { Default = Library.KeybindFrame.Visible, Text = "Open Keybind Menu", Callback = function(value) Library.KeybindFrame.Visible = value end})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
MenuGroup:AddButton("Unload", function() Library:Unload() end)

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MonarchCore/Themes')
SaveManager:SetFolder('MonarchCore/' .. GAME_NAME)

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs.Settings)

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs.Settings)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
