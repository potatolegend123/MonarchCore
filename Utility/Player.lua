Troves.PlayerTrove = Trove.new()
Troves.CharacterTrove = Trove.new() 

LocalPlayer = Players.LocalPlayer
Character, Humanoid, RootPart, Backpack, PlayerGui = nil, nil, nil, nil, nil

_PLAYER = {
    Died = false,
    Alive = true,
}

local function onCharacterAdded(NewCharacter)
    Character = NewCharacter
    Humanoid = Character:FindFirstChildWhichIsA("Humanoid") or Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
    Backpack = LocalPlayer:WaitForChild("Backpack")
    PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

    _PLAYER.Died = false
    _PLAYER.Alive = true

    Troves.CharacterTrove:Destroy()
    Troves.CharacterTrove = Trove.new()
    Troves.CharacterTrove:Add(Humanoid.Died:Connect(function()
        _PLAYER.Died = true
        _PLAYER.Alive = false
    end))

end

Troves.PlayerTrove:Connect(LocalPlayer.CharacterAdded, onCharacterAdded)

onCharacterAdded(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())

-- ANTI AFK
if getconnections then
    for _, connection in pairs(getconnections(LocalPlayer.Idled)) do
        if connection["Disable"] then
            connection["Disable"](connection)
        elseif connection["Disconnect"] then
            connection["Disconnect"](connection)
        end
    end
else
    LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end