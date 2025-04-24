local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("TEaST", "RJTheme4")

local Tab = Window:NewTab("Stars")

local Section = Tab:NewSection("TEST")

Section:NewButton("Auto Farm Stars", "Teleport to stars", function()
    print("ві забалелі спідам")
    local Players = game:GetService("Players")
    local StarsFolder = game.Workspace.Stars

    local function teleportToStars(player)
    local character = player.Character or player.CharacterAdded:Wait()
        for _, star in StarsFolder:GetChildren() do
            if star:IsA("Part") then
                character:MoveTo(star.Position)
                task.wait(0.1)  -- Wait for second before moving to the next star
            end
        end
    end

    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            teleportToStars(player)
        end)
    end)

    for _, player in Players:GetPlayers() do
        player.CharacterAdded:Connect(function()
                print("ві забалелі спідам")
            teleportToStars(player)
        end)
    end
end)
