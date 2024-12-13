-- Variables
local Root = script.Parent.Parent
local Packages = script.Parent.Parent.Parent.roblox_packages

local Debugger = require(Packages.debugger)
local Utils = require(Root.Utility)
local Is = require(Root.Is)
local Types = require(Root.Types)

local Spr = require(script.Parent.Spr)

local Class = {}
local Animatable = {
	"boolean",
	"number",
	"NumberRange",
	"UDim",
	"UDim2",
	"Vector2",
	"Vector3",
	"Color3",
	"ColorSequence",
	"NumberSequence",
	"CFrame",
}

-- Functions

function Class._Bind(self: Types.Spring, prop: string, instance: Instance)
	(instance :: any)[prop] = self._Goal:Get()
    self._Animated = instance
	self._Goal:Listen(function(new)
		Spr.target(instance, self._Damping, self._Frequency, {
			[prop] = new,
		})
	end)
end

--[[
	Gets the current value that the spring is moving.

    [Learn More](https://luminlabsdev.github.io/ui-framework/api/spring/#get)
]]
function Class.Get(self: Types.Spring): Types.Animatable
	return 1
end

--[[
	Destroys the spring object.

    [Learn More](https://luminlabsdev.github.io/ui-framework/api/spring/#destroy)
]]
function Class.Destroy(self: Types.Spring)
	(self :: any)._Goal:Destroy()
	table.clear(self :: any)
	setmetatable(self :: any, nil)
end

--[=[
	Creates a new spring with a set goal.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#spring)
]=]
return function(goal: Types.State, damping: number?, frequency: number?): Types.SpringExport
	Debugger.Assert(table.find(Animatable, typeof((goal :: any):Get())), "NotAnimatable", typeof((goal :: any):Get()))
	Debugger.Assert(Is.Constructor(goal :: any), "InvalidType", "State", type(goal))

	local self = setmetatable({}, { __index = Class })

	self._Type = "spring"
	self._Damping = damping or 1
	self._Frequency = frequency or 1
    self._Animated = nil
	self._Goal = goal

	return self :: any
end
