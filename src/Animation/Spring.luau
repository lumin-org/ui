-- Variables
local Root = script.Parent.Parent
local Packages = script.Parent.Parent.Parent.roblox_packages

local Debugger = require(Packages.debugger)
local Utils = require(Root.Utility)
local Is = require(Root.Is)
local Types = require(Root.Types)

local Spr = require(script.Parent.Spr)

local Class = {}

-- Functions

function Class._Bind(self: Types.Spring, prop: string, instance: Instance)
    (instance :: any)[prop] = self._Goal:Get()
    self._Goal:Listen(function(new)
        Spr.target(instance, self._Damping, self._Frequency, {
            [prop] = new
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
	Utils.CleanMetatable(self :: any)
end

--[=[
	Creates a new spring with a set goal. Can be used in place of a tween.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#spring)
]=]
return function(goal: Types.State, damping: number?, frequency: number?): Types.SpringExport
    Debugger.Assert(Is.Constructor(goal :: any), "InvalidType", "State", type(goal))

	local self = setmetatable({}, { __index = Class })

	self._Type = "spring"
	self._Damping = damping or 1
	self._Frequency = frequency or 1
	self._Goal = goal

	return self :: any
end
