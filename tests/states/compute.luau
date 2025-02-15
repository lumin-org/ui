-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "STATE-TEST"

local State = UI.State
local TestState = State("Initial")

TestState:Listen(function(new)
    print(`{TEST_NAME}:`, new, "Listener")
end)

print(`{TEST_NAME}:`, TestState:Get())
TestState:Set("Different")
print(`{TEST_NAME}:`, TestState:Get(), "Default")

return {}
