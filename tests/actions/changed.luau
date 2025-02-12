-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "CHANGED-TEST"

local New = UI.New
local Changed = UI.Changed
local Scope = {}

local ToChange = New "Frame" {
    Changed("Name", function(changed: string)
        print(`{TEST_NAME}: {changed}`)
    end, Scope)
}

ToChange.Name = "Different"
print(`{TEST_NAME}:`, Scope)

return {}
