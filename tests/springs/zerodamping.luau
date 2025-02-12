-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "ZERO-DAMPING-TEST"

local New = UI.New
local State = UI.State
local Spring = UI.Spring

local SpringState = State(UDim2.fromOffset(100, 100))
local SizeSpring = Spring(SpringState, 0, 1)

local Frame = New "Frame" {
    Size = SizeSpring,
}

print(`{TEST_NAME}:`, Frame.Size)

SpringState:Set(UDim2.fromOffset(50, 50))

task.wait(1)

print(`{TEST_NAME}:`, Frame.Size)


return {}
