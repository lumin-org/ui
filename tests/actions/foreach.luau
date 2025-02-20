-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local TEST_NAME = "FOREACH-TEST"

local New = UI.New
local State = UI.State({"Text 3", "Text 4"})
local ForEach = UI.ForEach

New "Frame" {
    ForEach({"Text 1", "Text 2"}, function(index, value)
        print(`{TEST_NAME}: {index} {value}`)
        return New "TextLabel" {
            Text = value
        }
    end)
}

New "Frame" {
    ForEach(State, function(index, value)
        print(`{TEST_NAME}: {index} {value}`)
        return New "TextLabel" {
            Text = value
        }
    end)
}

task.wait(3)
State:Set({"Text 5", "Text 6"})
task.wait(0.5)
State:Set({"Text 7", "Text 8"})
task.wait(0.5)
State:Set({"Text 9", "Text 10"})
task.wait(0.5)

return {}
