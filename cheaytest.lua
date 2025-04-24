local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("TEST", "RJTheme1")

local Tab = Window:NewTab("Stars")

local Section = Tab:NewSection("TEST")

Section:NewButton("wd", "wda", function()
    print("Clicked")
end)
