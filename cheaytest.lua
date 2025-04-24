local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Yeet A Friend (0.1 тест)", "RJTheme3")

local Tab = Window:NewTab("Stars")

local Section = Tab:NewSection("AutoFarm")

-- Початкова швидкість телепортації
local teleportSpeed = 0.01

-- Слайдер для налаштування швидкості телепортації
Section:NewSlider("Teleport Speed", "Adjust the speed of teleportation", 1, 0.01, function(s)
    teleportSpeed = s  -- Оновлюємо швидкість телепортації
    print("Teleport Speed: " .. teleportSpeed)  -- Виводимо нову швидкість в консоль
end)

Section:NewButton("AutoFarm Stars", "Teleport to stars (VIP STARS SKIP)", function()
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer

    local function getCharacter()
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        return char, hrp
    end

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and string.find(obj.Name, "Root") then
            -- Перевірка на колір
            local color = obj.Color
            if color == Color3.fromRGB(165, 85, 19) then
                continue -- Пропускаємо об'єкти з цим кольором
            end

            -- Телепортація
            local _, hrp = getCharacter()
            hrp.CFrame = obj.CFrame + Vector3.new(0, 5, 0)
            wait(teleportSpeed) -- Використовуємо слайдер для контролю затримки
        end
    end
end)
