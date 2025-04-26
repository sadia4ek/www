local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Yeet A Friend",
   Icon = 0, -- Иконка в топбаре
   LoadingTitle = "shdite epta",
   LoadingSubtitle = "nasosi",
   Theme = "DarkBlue",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Можешь указать свою папку
      FileName = "Big Hub"
   }
})

local Tab = Window:CreateTab("⭐Stars⭐", 0)

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
                  continue -- Пропустить звёзды нежелательного цвета
               end

               local _, hrp = getCharacter()
               hrp.CFrame = root.CFrame
               task.wait(0.2)
            end
         end
      end
   end
})
