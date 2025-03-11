-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "TAG-TEST"

local New = UI.New
local Tags = UI.Tags

local ToTag = New "Frame" {
    Tags({"Tag1", "Tag2", "Tag3"}),
}

print(`{TEST_NAME}:`, ToTag:GetTags())

return {}
