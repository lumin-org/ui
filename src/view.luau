-- Variables
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Root = script.Parent
local New = require(Root.new)

-- Module

--[=[
	Creates a new view (ScreenGui) for your elements. This acts a shortcut and
    cleaner method for creation of a ScreenGui.

	[Open Documentation](https://lumin-org.github.io/ui/api/#view)
]=]
return function(props: { any }): ScreenGui
    local Props = {
        Name = "Root",
        IgnoreGuiInset = false,
        Parent = Player:WaitForChild("PlayerGui"),
    }

    for name, value in props do
        Props[name] = value
    end

	return New("ScreenGui")(Props)
end
