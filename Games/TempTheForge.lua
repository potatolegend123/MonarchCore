local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Knit = require(ReplicatedStorage.Shared.Packages.Knit)
local Controllers = Knit.GetControllers()
local Services = {}

for i, v in ReplicatedStorage.Shared.Packages.Knit.Services:GetChildren() do
    if not v:IsA("Folder") then continue end
    Services[v.Name] = Knit.GetService(v.Name)
end

for i, v in Controlers.CharacterController do
    print(i,v )
end

replicatesignal(LocalPlayer)

Services.ToolService:ToolActivated("Pickaxe")
Services.ToolService:ToolActivated("Weapon")

-- // SellItems
-- Services.DialogueService:RunCommand("SellConfirm", {
--     ["Basket"] = {
--         ["Stone"] = 2,
--         ["Tin"] = 1,
--         ["Silver"] = 1,
--         ["Iron"] = 3,
--         ["Medium Essence"] = 1,
--         ["Copper"] = 3,
--         ["Sand Stone"] = 2
--     }
-- })