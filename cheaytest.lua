local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Все возможные клавиши (без пробела)
local possibleKeys = {
    Enum.KeyCode.A, Enum.KeyCode.B, Enum.KeyCode.C, Enum.KeyCode.D, Enum.KeyCode.E,
    Enum.KeyCode.F, Enum.KeyCode.G, Enum.KeyCode.H, Enum.KeyCode.I, Enum.KeyCode.J,
    Enum.KeyCode.K, Enum.KeyCode.L, Enum.KeyCode.M, Enum.KeyCode.N, Enum.KeyCode.O,
    Enum.KeyCode.P, Enum.KeyCode.Q, Enum.KeyCode.R, Enum.KeyCode.S, Enum.KeyCode.T,
    Enum.KeyCode.U, Enum.KeyCode.V, Enum.KeyCode.W, Enum.KeyCode.X, Enum.KeyCode.Y, Enum.KeyCode.Z,
}

-- Переменная для хранения задержки (по умолчанию 0.05)
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

        -- Нажимаем и отпускаем
        VirtualInputManager:SendKeyEvent(true, key, false, game)
        task.wait(pressDelay)
        VirtualInputManager:SendKeyEvent(false, key, false, game)
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

-- Кнопка запуска
Tab:CreateButton({
    Name = "Fast Edit",
    Callback = pressRandomKeys,
})

-- Слайдер регулировки скорости
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
