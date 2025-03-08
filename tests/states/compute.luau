-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "COMPUTE-TEST"

local Compute = UI.Compute
local State = UI.State

local TestState = State(100)
local TestCompute = Compute(function()
    return TestState() * 2
end, {TestState :: any})

print(`{TEST_NAME}:`, TestCompute(), ": should: 200")
TestState(200)
print(`{TEST_NAME}:`, TestCompute(), ": should: 400")

return {}
