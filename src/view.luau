-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local New = require("./new")

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllowedNames = { "Screen", "Billboard", "Surface" }

-- Module

--[=[
	Creates a new view for your elements.

	[Open Documentation](https://lumin-org.github.io/ui/api/#view)
]=]
return function(props: Types.Properties): Types.View
	props.Name = props.Name or "Root"

	local Type = "ScreenGui"

	if props.Type then
		Debugger.assert(table.find(AllowedNames, props.Type :: any), "ViewInvalidType", props.Type)
		Type = `{props.Type}Gui`
		props.Type = nil
	end

	if Type == "ScreenGui" and not props.Parent then
		props.Parent = Player:WaitForChild("PlayerGui")
	end

	return New(Type)(props :: any)
end
