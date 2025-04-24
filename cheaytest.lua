local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("TEцфцT", "RJTheme5")

local Tab = Window:NewTab("Stars")

local Section = Tab:NewSection("TEST")

Section:NewButton("Auto Farm Stars", "Teleport to stars", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local starsFolder = workspace:WaitForChild("Stars")
    
    for _, star in ipairs(starsFolder:GetChildren()) do
    	if star:IsA("BasePart") then
    		humanoidRootPart.CFrame = star.CFrame + Vector3.new(0, 5, 0) -- телепорт трохи вище
    		wait(1) -- затримка між телепортами
    	end
    end
end)
