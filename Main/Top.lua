Library = loadstring(game:HttpGet(REPO.LIBRARY .. 'Library.lua'))()
ThemeManager = loadstring(game:HttpGet(REPO.LIBRARY .. 'ThemeManager.lua'))()
SaveManager = loadstring(game:HttpGet(REPO.LIBRARY .. 'SaveManager.lua'))()

Options = Library.Options
Toggles = Library.Toggles

getgenv().MONARCHLOADED = Library

Library.ShowToggleFrameInKeybinds = true -- Make toggle keybinds work inside the keybinds UI (aka adds a toggle to the UI). Good for mobile users (Default value = true)
Library.ShowCustomCursor = false -- Toggles the Linoria cursor globaly (Default value = true)
Library.NotifySide = "Left" -- Changes the side of the notifications globaly (Left, Right) (Default value = Left)

Window = Library:CreateWindow({
	Title = "Monarch Core | " .. GAME_NAME,
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = false,
	UnlockMouseWhileOpen = true,
	NotifySide = "Left",
	TabPadding = 8,
	MenuFadeTime = 0.2
})

Tabs = {}