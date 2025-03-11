-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "OVER-DAMPING-TEST"

local New = UI.New
local Spring = UI.Spring
local State = UI.State

local SizeSpringState = State(UDim2.fromOffset(100, 100))
local SizeSpring = Spring(SizeSpringState :: any, 3, 1)

local Frame = New "Frame" {
    Size = SizeSpring,
}

print(`{TEST_NAME}:`, Frame.Size)

SizeSpringState(UDim2.fromOffset(50, 50))

task.wait(1)

print(`{TEST_NAME}:`, Frame.Size)


return {}