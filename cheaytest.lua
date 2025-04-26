local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Yeet A Friend", "GrapeTheme")


Section:NewButton("AutoFarm Stars", "Teleport to Stars", function()
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer

    local function getCharacter()
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        return char, hrp
    end

    local starsFolder = workspace:FindFirstChild("Stars")
    if not starsFolder then
        warn("Папка 'Stars' не найдена в workspace.")
        return
    end

    for _, model in ipairs(starsFolder:GetChildren()) do
        if model:IsA("Model") then
            local root = model:FindFirstChild("Root")
            if root and root:IsA("BasePart") then
                local color = root.Color
                if color == Color3.fromRGB(165, 85, 19) then
                    continue -- Пропустить если нежелательный цвет
                end

                local _, hrp = getCharacter()
                hrp.CFrame = root.CFrame
                wait(0.2)
            end
        end
    end
end)
