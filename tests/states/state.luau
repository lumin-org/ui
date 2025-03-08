-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "STATE-TEST"

local State = UI.State
local TestState: UI.State<string> = State("Initial")

print(`{TEST_NAME}:`, TestState())
TestState("Different")
print(`{TEST_NAME}:`, TestState(), "Default")
print(`{TEST_NAME}:`, TestState("Really Different"), "Default")

return {}
