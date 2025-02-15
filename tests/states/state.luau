-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "COMPUTE-TEST"

local Compute = UI.Compute
local State = UI.State

local TestState = State(100)
local TestCompute = Compute(function()
    return TestState:Get() * 2
end, {TestState})

print(`{TEST_NAME}:`, TestCompute:Get(), ": should: 200")
TestState:Set(200)
print(`{TEST_NAME}:`, TestCompute:Get(), ": should: 400")

return {}
