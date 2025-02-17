-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "VIEW-TEST"

local View = UI.View
local New = UI.New

local TestView = View {
    Type = "Screen",
    New "Frame" {
        Name = "Frame",
        Size = UDim2.fromOffset(100, 100),
    }   
}

print(`{TEST_NAME}:`, TestView.Name)

return {}
