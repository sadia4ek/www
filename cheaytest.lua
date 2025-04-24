local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Yeet A Friend (0.1 тест)", "RJTheme3")

local Tab = Window:NewTab("Stars")

local Section = Tab:NewSection("AutoFarm")

Section:NewButton("Auto Farm Stars", "Teleport to stars", function()
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer

    -- Чекаємо поки персонаж і HRP завантажаться
    local function getCharacter()
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        return char, hrp
    end

    local starsFolder = workspace:FindFirstChild("Stars")
    if not starsFolder then
        warn("Папка Stars не знайдена!")
        return
    end

    for _, star in ipairs(starsFolder:GetChildren()) do
        if star:IsA("BasePart") then
            local _, hrp = getCharacter()
            hrp.CFrame = star.CFrame + Vector3.new(0, 5, 0)
            wait(0.5)
        end
    end
end)

