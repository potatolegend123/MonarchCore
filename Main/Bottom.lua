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
	ESPLibrary.cleanup()
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

ThemeManager:SetLibrary(Library)

SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('MonarchCore/Themes')

SaveManager:SetFolder('MonarchCore/' .. GAME_NAME)
SaveManager:BuildConfigSection(Tabs.Settings)

ThemeManager:ApplyToTab(Tabs.Settings)

SaveManager:HookAutoSave()
SaveManager:LoadAutoloadConfig()