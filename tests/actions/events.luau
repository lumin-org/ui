-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "EVENT-TEST"

local New = UI.New
local Event = UI.Event
local Scope = {}

New "TextButton" {
    Text = TEST_NAME,
    Size = UDim2.fromOffset(100, 100),
    Event("Activated", function()
        print(`{TEST_NAME}: Clicked`)
    end, Scope)
}

print(`{TEST_NAME}:`, Scope)

return {}
