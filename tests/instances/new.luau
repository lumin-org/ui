-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "NEW-TEST"

local New = UI.New
local Frame = New "Frame" {
    Name = "Frame"
}

print(`{TEST_NAME}:`, Frame.Name)

return {}
