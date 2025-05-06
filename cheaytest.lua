local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Все возможные клавиши (кроме пробела)
local possibleKeys = {
    Enum.KeyCode.A, Enum.KeyCode.B, Enum.KeyCode.C, Enum.KeyCode.D, Enum.KeyCode.E,
    Enum.KeyCode.F, Enum.KeyCode.G, Enum.KeyCode.H, Enum.KeyCode.I, Enum.KeyCode.J,
    Enum.KeyCode.K, Enum.KeyCode.L, Enum.KeyCode.M, Enum.KeyCode.N, Enum.KeyCode.O,
    Enum.KeyCode.P, Enum.KeyCode.Q, Enum.KeyCode.R, Enum.KeyCode.S, Enum.KeyCode.T,
    Enum.KeyCode.U, Enum.KeyCode.V, Enum.KeyCode.W, Enum.KeyCode.X, Enum.KeyCode.Y, Enum.KeyCode.Z,
}

-- Функция для случайного нажатия клавиш
local function pressRandomKeys()
    local used = {}

    for i = 1, 18 do
        local key
        repeat
            key = possibleKeys[math.random(1, #possibleKeys)]
        until not used[key]
        used[key] = true

        -- Нажатие клавиши
        VirtualInputManager:SendKeyEvent(true, key, false, game)
        wait(0.05)
        VirtualInputManager:SendKeyEvent(false, key, false, game)
    end
end

-- GUI кнопка запуска
Rayfield:CreateWindow({
    Name = "Random Key Presser",
    LoadingTitle = "Загрузка...",
    LoadingSubtitle = "by ты",
    ConfigurationSaving = {
        Enabled = false,
    }
}):CreateTab("Main"):CreateButton({
    Name = "Нажать 18 случайных кнопок",
    Callback = pressRandomKeys,
})
