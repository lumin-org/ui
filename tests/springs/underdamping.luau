-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "UNDER-DAMPING-TEST"

local New = UI.New
local Spring = UI.Spring

local SizeSpring = Spring(UDim2.fromOffset(100, 100), 0.5, 1)

local Frame = New "Frame" {
    Size = SizeSpring,
}

print(`{TEST_NAME}:`, Frame.Size)

SizeSpring:Set(UDim2.fromOffset(50, 50))

task.wait(1)

print(`{TEST_NAME}:`, Frame.Size)


return {}
