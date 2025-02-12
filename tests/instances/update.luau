-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "UPDATE-TEST"

local New = UI.New
local Update = UI.Update
local Frame = New "Frame" {
    Name = "NotUpdatedFrame"
}

print(`{TEST_NAME}:`, Frame.Name)

Update(Frame) {
    Name = "UpdatedFrame"
}

print(`{TEST_NAME}:`, Frame.Name)

return {}
