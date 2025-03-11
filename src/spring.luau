-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local Is = require("./is")

local Class = {}
Class.__index = Class
Class.__call = function(self)
	return self._Value
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

	local GoalStateType = Is(goal)
	Debugger.assert(
		GoalStateType == "State" or GoalStateType == "Compute",
		"InvalidType",
		"state or compute",
		GoalStateType
	)

	local GoalType = Is((goal :: any)())
	Debugger.assert(table.find(Animatable, GoalType), "SpringNotAnimatable", GoalType)

	local self = setmetatable({}, Class)

	self._Value = (goal :: any)()
	self._Observers = {} :: { (changed: any) -> () }
	self._Damping = damping or 1
	self._Speed = speed or 1
	self._Type = "Spring"

	table.insert(((goal :: any)._Observers) :: { (changed: any) -> () }, function(changed)
		self._Value = changed
		for _, observer in self._Observers do
			observer(changed)
		end
	end)

	return self :: any
end
