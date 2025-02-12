-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "FOREACH-TEST"

local New = UI.New
local ForEach = UI.ForEach

New "Frame" {
    ForEach({"Text 1", "Text 2"}, function(index, value)
        print(`{TEST_NAME}: {index} {value}`)
        return New "TextLabel" {
            Text = value
        }
    end)
}

return {}
