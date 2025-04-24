local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Yeet A Friend (0.1 тест)", "RJTheme3")

local Tab = Window:NewTab("Stars")

local Section = Tab:NewSection("AutoFarm")

Section:NewButton("TP to all 'Root'", "Teleport to all objects with 'Root' in name", function()
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer

    local function getCharacter()
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        return char, hrp
    end

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and string.find(obj.Name, "Root") then
            local _, hrp = getCharacter()
            hrp.CFrame = obj.CFrame + Vector3.new(0, 5, 0)
            wait(0.5)
        end
    end
end)

