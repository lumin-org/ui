-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local Spr = require("../roblox_packages/spr")
local Is = require("./is")

local Class = {}
Class.__index = Class
Class.__call = function(self)
	return self._Value -- Get goal
end

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
	table.insert((self :: any)._Instances :: { Instance }, instance);
	(instance :: any)[prop] = (self :: any)._Value(); -- Set the prop of the instance to the initial goal
	(self :: any)._Value:Listen(function(new) -- When the goal changes, set the target to the new value
		Spr.target(instance, (self :: any)._Damping, (self :: any)._Speed, {
			[prop] = new,
		})
	end)
end

--[[
	Stops the current spring from moving, leaving it at its current position.

    [Open Documentation](https://lumin-org.github.io/ui/api/spring/#stop)
]]
function Class.Stop(self: Types.Spring)
	if (self :: any)._Instances then
		-- Iterate through all instances to make sure if the spring is used on
		-- multiple objects, they are all stopped
		for _, instance in self._Instances do
			Spr.stop(instance)
		end
		return
	end
	Debugger.fatal("SpringNotUsed")
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
return function(
	goal: Types.State<Types.Animatable> | Types.Compute<Types.Animatable>,
	damping: number?,
	speed: number?
): Types.Spring
	if damping then
		Debugger.assert(damping >= 0, "SpringInvalidDamping", damping)
	end

	if speed then
		Debugger.assert(speed >= 0, "SpringInvalidSpeed", speed)
	end

	local GoalType = Is(goal)
	local GoalValueType = Is((goal :: any)())
	Debugger.assert(GoalType == "State" or GoalType == "Compute", "InvalidType", "state or compute", GoalType)
	Debugger.assert(table.find(Animatable, GoalValueType), "SpringNotAnimatable", GoalValueType)

	local self = setmetatable({}, Class)

	self._Instances = {}
	self._Value = goal
	self._Damping = damping or 1
	self._Speed = speed or 1
	self._Type = "Spring"

	return self :: any
end
