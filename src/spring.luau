-- Variables
local Types = require("./types")
local State = require("./state")
local Debugger = require("../roblox_packages/debugger")
local Spr = require("../roblox_packages/spr")

local Class = {}
Class.__index = Class

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
	table.insert(self._Instances, instance);
	(instance :: any)[prop] = self._Goal:Get() -- Set the prop of the instance to the initial goal
	self._Goal:Listen(function(new) -- When the goal changes, set the target to the new value
		Spr.target(instance, self._Damping, self._Speed, {
			[prop] = new,
		})
	end)
end

--[[
	Stops the current spring from moving, leaving it at its current position.

    [Open Documentation](https://lumin-org.github.io/ui/api/spring/#stop)
]]
function Class.Stop(self: Types.Spring)
	if self._Instances then
		-- Iterate through all instances to make sure if the spring is used on
		-- multiple objects, they are all stopped
		for _, instance in self._Instances do
			Spr.stop(instance)
		end
	end
end

--[[
	Sets the end goal of the spring.

    [Open Documentation](https://lumin-org.github.io/ui/api/spring/#set)
]]
function Class.Set(self: Types.Spring, value: Types.Animatable): Types.Animatable
    Debugger.assert(table.find(Animatable, typeof(value)), "SpringNotAnimatable", typeof(value))
    return self._Goal:Set(value)
end

--[[
	Gets the end goal of the spring.

    [Open Documentation](https://lumin-org.github.io/ui/api/spring/#get)
]]
function Class.Get(self: Types.Spring): Types.Animatable
	return self._Goal:Get()
end

--[[
	Destroys the spring object.

    [Open Documentation](https://lumin-org.github.io/ui/api/spring/#destroy)
]]
function Class.Destroy(self: Types.Spring)
	(self :: any)._Goal:Destroy()
	table.clear(self :: any)
	setmetatable(self :: any, nil)
end

--[=[
	Creates a new spring with a set goal.

	[Open Documentation](https://lumin-org.github.io/ui/api/#spring)
]=]
return function(goal: Types.Animatable, damping: number?, speed: number?): Types.Spring
	Debugger.assert(table.find(Animatable, typeof(goal)), "SpringNotAnimatable", typeof(goal))
    
    if damping then
        Debugger.assert(damping >= 0, "SpringInvalidDamping", damping)
    end
    
    if speed then
        Debugger.assert(speed >= 0, "SpringInvalidSpeed", speed)
    end

	local self = setmetatable({}, Class)
    goal = (State(goal) :: any)

	self._Damping = damping or 1
	self._Speed = speed or 1
	self._Instances = {}
	self._Goal = goal

	return self :: any
end
