local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("TEцфцT", "RJTheme5")

local Tab = Window:NewTab("Stars")

local Section = Tab:NewSection("TEST")

Section:NewButton("Auto Farm Stars", "Teleport to stars", function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local starsFolder = workspace:WaitForChild("Stars")

    for _, star in ipairs(starsFolder:GetChildren()) do
        if star:IsA("BasePart") then
            hrp.CFrame = star.CFrame + Vector3.new(0, 5, 0)
            wait(0.5)
        end
    end
end)
