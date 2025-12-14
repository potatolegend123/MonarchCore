Tabs.Misc = Window:AddTab('Misc')

local SERVER_BOX = Tabs.Misc:AddLeftGroupbox('Server')
local CHARACTER_BOX = Tabs.Misc:AddRightGroupbox('Character')
local GAME_BOX = Tabs.Misc:AddLeftGroupbox('Game')

task.wait(1)
SERVER_BOX:AddDivider()

SERVER_BOX:AddInput('JOBID_INPUT', {
	Default = "",
	Finished = false, 
	ClearTextOnFocus = true, 
	Placeholder = 'Enter Place Id',
})

SERVER_BOX:AddButton({
    Text = 'Teleport',
    Func = function()
        TeleportService:TeleportToPlaceInstance(PlaceId, Options.JOBID_INPUT.Value, LocalPlayer)
    end,
})

SERVER_BOX:AddDivider()

SERVER_BOX:AddLabel('JobIDLabel', {
	Text = "JobID:" .. tostring(JobId or "N/A"),
	DoesWrap = true -- Defaults to false
})
SERVER_BOX:AddLabel('PlaceIDLabel', {
    Text = "PlaceID:" .. tostring(PlaceId or "N/A"),
    DoesWrap = true -- Defaults to false
})
SERVER_BOX:AddLabel('UniverseIDLabel', {
    Text = "UniverseID:" .. tostring(UNIVERSE_ID or "N/A"),
    DoesWrap = true -- Defaults to false
})

SERVER_BOX:AddButton({
	Text = 'Copy Job ID',
	Func = function()
        setclipboard(tostring(JobId))
	end,
}):AddButton({
    Text = 'Copy Place ID',
    Func = function()
        setclipboard(tostring(PlaceId))
    end,
})
SERVER_BOX:AddButton({
    Text = 'Copy Universe ID',
    Func = function()
        setclipboard(tostring(UNIVERSE_ID))
    end,
})

SERVER_BOX:AddDivider()
SERVER_BOX:AddButton({
	Text = 'Rejoin',
	Func = function()
        TeleportService:TeleportToPlaceInstance(PlaceId, JobId, LocalPlayer)
	end,
	Tooltip = 'Rejoin the same server',
	Visible = true -- Will make the button invisible (true / false)
})

local serverHopping = false
SERVER_BOX:AddButton({
	Text = 'Server Hop',
	Func = function()
        if serverHopping then 
            Library:Notify({
                Title = "Server Hop",
                Description = "Finding, Please wait!",
                Time = 5,
                SoundId = 4590657391,
            })
            return 
        end
        serverHopping = true

        local servers = {}
        local req = game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
        local body = HttpService:JSONDecode(req)
        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end
        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], LocalPlayer)
        else
            Library:Notify({
                Title = "Server Hop",
                Description = "No available servers found!",
                Time = 5,
                SoundId = 4590657391,
            })
        end
        task.wait(1)
        serverHopping = false
	end,
	Tooltip = 'Join a different server',
	Visible = true -- Will make the button invisible (true / false)
})

local lowestServer = false
SERVER_BOX:AddButton({
	Text = 'Lowest Server Hop',
	Func = function()
        if lowestServer then 
            Library:Notify({
                Title = "Lowest Server",
                Description = "Finding, Please wait!",
                Time = 5,
                SoundId = 4590657391,
            })
            return 
        end
        lowestServer = true

        local _servers = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        function ListServers(cursor)
           local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
           return HttpService:JSONDecode(Raw)
        end

        local Server, Next; repeat
           local Servers = ListServers(Next)
           Server = Servers.data[1]
           Next = Servers.nextPageCursor
        until Server

        TeleportService:TeleportToPlaceInstance(PlaceId, Server.id, game.Players.LocalPlayer)

        task.wait(1)
        lowestServer = false
	end,
	Tooltip = 'Join the server with the lowest player count',
	Visible = true -- Will make the button invisible (true / false)
})

CHARACTER_BOX:AddDivider()
CHARACTER_BOX:AddSlider('WALKSPEED_SLIDER', {
	Text = 'Walk Speed',
	Default = 16,
	Min = 0,
	Max = 100,
	Rounding = 0,
})
CHARACTER_BOX:AddToggle('WALKSPEED_TOGGLE', {
	Text = 'Enabled',
	Default = false,
})
CHARACTER_BOX:AddSlider('JUMPPOWER_SLIDER', {
	Text = 'Jump Power',
	Default = 50,
	Min = 0,
	Max = 200,
	Rounding = 0,
})
CHARACTER_BOX:AddToggle('JUMPPOWER_TOGGLE', {
	Text = 'Enabled',
	Default = false,
})
CHARACTER_BOX:AddDivider()
CHARACTER_BOX:AddToggle('NOCLIP_TOGGLE', {
    Text = 'Noclip',
    Default = false,
})
CHARACTER_BOX:AddToggle('INFINITE_JUMP_TOGGLE', {
    Text = 'Infinite Jump',
    Default = false,
})

Troves.Global:Connect(UserInputService.JumpRequest, function()
    if not Toggles.INFINITE_JUMP_TOGGLE.Value or _PLAYER.Alive == false then return end
    Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)

RunService.RenderStepped:Connect(function()
    if _PLAYER.Alive then
        if Toggles.WALKSPEED_TOGGLE.Value then
            Humanoid.WalkSpeed = Options.WALKSPEED_SLIDER.Value
        end
        if Toggles.JUMPPOWER_TOGGLE.Value then
            Humanoid.JumpPower = Options.JUMPPOWER_SLIDER.Value
        end
        if Toggles.NOCLIP_TOGGLE.Value then
            if Character ~= nil then
            	for _, child in pairs(Character:GetDescendants()) do
            		if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
            			child.CanCollide = false
            		end
            	end
            end
        end
    end
end)