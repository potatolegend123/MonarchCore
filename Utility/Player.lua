local REPO = "https://raw.githubusercontent.com/potatolegend123/MonarchCore/refs/heads/main/"
local REPO_UTILITY = REPO .. "Utility/"
local REPO_GAMES = REPO .. "Games/"
local REPO_LIBRARY = REPO .. "Library/"
local REPO_DEBUG = REPO .. "Debug/"
local REPO_MAIN = REPO .. "Main/"

local PlayerTrove = Trove.new()
local CharacterTrove = Trove.new()

LocalPlayer = Players.LocalPlayer
Character, Humanoid, RootPart, Backpack, PlayerGui = nil, nil, nil, nil, nil

getgenv()._PLAYER = {
    Died = false,
    Alive = true,
}

local function onCharacterAdded(NewCharacter)
    _PLAYER.Died = false
    _PLAYER.Alive = true
    
    Character = NewCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
    Backpack = LocalPlayer:WaitForChild("Backpack")
    PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

    CharacterTrove:Destroy()
    CharacterTrove = Trove.new()
    CharacterTrove:Add(Humanoid.Died:Connect(function()
        _PLAYER.Died = true
        _PLAYER.Alive = false
    end))

end

PlayerTrove:Connect(LocalPlayer.CharacterAdded, onCharacterAdded)

onCharacterAdded(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())