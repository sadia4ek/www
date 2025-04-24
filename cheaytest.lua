local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("beta", "RJTheme3") 

local Tab = Window:NewTab("qwe")

local Section = Tab:NewSection("Section Name")

Section:NewButton("AutoStars", "ne rabotaet sosi", function()
    print("test")
end
