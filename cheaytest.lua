local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")

-- Все возможные клавиши (без пробела)
local possibleKeys = {
    Enum.KeyCode.A, Enum.KeyCode.B, Enum.KeyCode.C, Enum.KeyCode.D, Enum.KeyCode.E,
    Enum.KeyCode.F, Enum.KeyCode.G, Enum.KeyCode.H, Enum.KeyCode.I, Enum.KeyCode.J,
    Enum.KeyCode.K, Enum.KeyCode.L, Enum.KeyCode.M, Enum.KeyCode.N, Enum.KeyCode.O,
    Enum.KeyCode.P, Enum.KeyCode.Q, Enum.KeyCode.R, Enum.KeyCode.S, Enum.KeyCode.T,
    Enum.KeyCode.U, Enum.KeyCode.V, Enum.KeyCode.W, Enum.KeyCode.X, Enum.KeyCode.Y, Enum.KeyCode.Z,
}

-- Переменная для хранения задержки
local pressDelay = 0.05

-- Функция нажатия 18 случайных клавиш
local function pressRandomKeys()
    local used = {}
    for i = 1, 18 do
        local key
        repeat
            key = possibleKeys[math.random(1, #possibleKeys)]
        until not used[key]
        used[key] = true
        VirtualInputManager:SendKeyEvent(true, key, false, game)
        task.wait(pressDelay)
        VirtualInputManager:SendKeyEvent(false, key, false, game)
    end
end

-- Функции телепортации
local function teleportToRandomTrash()
    local player = Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local randomTrashCFrame = CFrame.new(-114.947807, 1.75305176, -1682.50854, -0.866007447, 0, -0.500031412, 0, 1, 0, 0.500031412, 0, -0.866007447)
        player.Character.HumanoidRootPart.CFrame = randomTrashCFrame
    end
end

-- Телепорты на другие локации (выше)
local function teleportToHoverboardShop()
    local player = Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hoverboardShopCFrame = CFrame.new(-154.575562, -203.793839, -1715.92407, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
        player.Character.HumanoidRootPart.CFrame = hoverboardShopCFrame
    end
end

-- Создание GUI окна
local Window = Rayfield:CreateWindow({
    Name = "Youtuber Simulator 2",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "im in depression😛",
    ConfigurationSaving = {
        Enabled = false
    }
})

local Tab = Window:CreateTab("Edit", 4483362458)
local Tab2 = Window:CreateTab("Video", 4483362458)
local Tab3 = Window:CreateTab("Teleport", 4483362458)

-- Кнопка быстрой правки
Tab:CreateButton({
    Name = "Fast Edit",
    Callback = pressRandomKeys,
})

-- Слайдер задержки между нажатиями
Tab:CreateSlider({
    Name = "Delay between keys",
    Range = {0.01, 1.0},
    Increment = 0.01,
    Suffix = "s",
    CurrentValue = pressDelay,
    Callback = function(Value)
        pressDelay = Value
    end,
})

-- Кнопки телепортации
Tab3:CreateButton({
    Name = "Teleport to Hoverboard Shop",
    Callback = teleportToHoverboardShop
})

-- Кнопка телепорта в Random Trash
Tab3:CreateButton({
    Name = "random trash lol💩",
    Callback = teleportToRandomTrash
})
