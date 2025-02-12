-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "CLEANUP-TEST"

local State = UI.State
local New = UI.New
local Cleanup = UI.Cleanup

local StateToClean = State(0)
local ToClean = New "Frame" {
    Cleanup({StateToClean})
}

ToClean:Destroy()
task.wait()
print(`{TEST_NAME}:`, StateToClean)

return {}
