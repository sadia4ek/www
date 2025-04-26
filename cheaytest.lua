local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Yeet A Friend",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "shdite epta",
   LoadingSubtitle = "nasosi",
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

local Tab = Window:CreateTab("⭐Stars⭐", 0) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Teleport to stars",
   Callback = function()
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
end,
})
