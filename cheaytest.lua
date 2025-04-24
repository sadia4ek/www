local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Yeet A Friend (обновфр", "RJTheme3")

local Tab = Window:NewTab("Stars")

local Section = Tab:NewSection("AutoFarm")

local teleportInProgress = false  -- Флаг для отслеживания текущего процесса телепортации

Section:NewButton("AutoFarm Stars", "Teleport to stars", function()
    -- Если телепортация уже в процессе, прерываем выполнение
    if teleportInProgress then
        print("Teleportation already in progress. Stopping.")
        return
    end

    teleportInProgress = true  -- Устанавливаем флаг, что процесс телепортации начался

    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer

    local function getCharacter()
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        return char, hrp
    end

    local teleported = false  -- Флаг, который отслеживает, были ли выполнены телепортации

    for _, obj in ipairs(workspace:GetDescendants()) do
        -- Проверка, что объект является частью модели в папке Stars и содержит "Root" в имени
        if obj:IsA("BasePart") and string.find(obj.Name, "Root") then
            local parent = obj.Parent
            if parent and parent.Name == "Stars" then
                -- Проверка на цвет
                local color = obj.Color
                if color == Color3.fromRGB(165, 85, 19) then
                    continue -- Пропускаем объекты с этим цветом
                end

                -- Телепортация
                local _, hrp = getCharacter()
                hrp.CFrame = obj.CFrame + Vector3.new(0, 0, 0)
                teleported = true  -- Отмечаем, что телепортация была выполнена
                wait(0.1) -- Используем слайдер для контроля задержки
            end
        end
    end

    -- Если не было телепортации, выводим сообщение
    if not teleported then
        print("No more stars to teleport to!")
    end

    teleportInProgress = false  -- Завершаем процесс телепортации
end)
