local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Yeet A Friend (обновфр", "RJTheme3")

local Tab = Window:NewTab("Stars")

local Section = Tab:NewSection("AutoFarm")

Section:NewToggle("AutoFarm Stars", "Teleport to stars", function(state)
    -- Получаем игрока и его персонажа
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    -- Функция проверки условий
    local function canTeleport(rootPart)
        -- Проверка, что парт находится в модели
        if not rootPart.Parent:IsA("Model") then
            return false
        end

        -- Проверка, что модель находится в папке Stars
        local parent = rootPart.Parent
        while parent do
            if parent.Name == "Stars" then
                return true
            end
            parent = parent.Parent
        end

        -- Если модель не в папке Stars, телепортация невозможна
        return false
    end

    -- Получаем объект Root (если он существует)
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        -- Проверяем, можно ли телепортировать
        if canTeleport(rootPart) then
            -- Проверка цвета Root
            if rootPart.Color ~= Color3.fromRGB(165, 85, 19) then
                -- Если тумблер активирован (state = true), телепортируем игрока к объекту Root
                if state then
                    character:SetPrimaryPartCFrame(rootPart.CFrame)
                end
            end
        end
    end
end)
