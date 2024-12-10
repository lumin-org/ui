-- Forked from dervexdev/advancedspring
-- Variables
local Root = script.Parent.Parent
local Packages = script.Parent.Parent.Parent.Parent.Packages

local RunService = game:GetService("RunService")

local Runtime = Root.Runtime
local Scheduler = require(Runtime.Scheduler)
local Storage = require(Runtime.Storage)

local Debugger = require(Packages.debugger)
local Utils = require(Root.Utility)
local Is = require(Root.Is)
local Types = require(Root.Types)

local Spring = require(script.Parent.Spr)

local Class = {}

local Epsilon = 1e-4

local sqrt = math.sqrt
local exp = math.exp
local cos = math.cos
local sin = math.sin
local pi = math.pi

-- Functions
local function IsSpringSettled(currentLinearPosition: { number }, targetLinearPosition: { number }): boolean
	for index, value in currentLinearPosition do
		if math.abs(value - targetLinearPosition[index]) > Epsilon then
			-- If the difference is more than the epsilon, then return false
			return false
		end
	end

	return true
end

function Class._Bind(self: Types.Spring, prop: string, instance: Instance)
	local Mode = RunService:IsClient() and "Client" or "Server"
	local Connection: ((number) -> ())?

	local TargetLinearPosition = self._DataType.ToLinear((self._State :: any):Get())
	local CurrentValue = (self._State :: any):Get()

	if CurrentValue ~= nil then
		(instance :: any)[prop] = CurrentValue
	end
	self._CurrentLinearPosition = TargetLinearPosition
;
	(self._State :: any):Listen(function(newValue)
		TargetLinearPosition = self._DataType.ToLinear(newValue)

		if Connection ~= nil then
			return -- The value changed when the spring was playing; don't create another connection, let the new one play
		end

		if not Connection then
			Connection = Scheduler:Add(Mode, function(delta: number)
				if self and (self :: any)._Update then
					(self :: any):_Update(TargetLinearPosition, delta);
					(instance :: any)[prop] = self._DataType.FromLinear(self._CurrentLinearPosition)
				else
					if Connection then
						Scheduler:Remove(Mode, Connection)
						return
					end
				end

				if IsSpringSettled(self._CurrentLinearPosition, TargetLinearPosition) == true and Connection then
					Scheduler:Remove(Mode, Connection)
					Connection = nil;
					(instance :: any)[prop] = (self :: any)._State:Get()

					for index = 1, #self._Velocity do
						self._Velocity[index] = 0
					end
				end
			end)
		end
	end)
end

function Class._Update(self: Types.Spring, targetLinearPosition: { number }, delta: number)
	for index = 1, #targetLinearPosition do
		-- DO NOT CHANGE ANYTHING IN THE CALCULATION UNLESS YOU KNOW WHAT YOU ARE DOING
		--[[
			d = damping
			f = frequency
			v = velocity
			c = constant
			i = cosine_angle
			j = sine_angle
			r1 = root1
			r2 = root2
			c2 = coefficient2
			c1 = coefficient1
			e1 = exp1
			e2 = exp2
		]]

		local d = self._Damping
		local f = self._Frequency * pi * 2
		local g = targetLinearPosition[index]
		local p = self._CurrentLinearPosition[index]
		local v = self._Velocity[index]

		local offset = p - g
		local decay = exp(-delta * d * f)

		if d == 1 then
			self._CurrentLinearPosition[index] = (v * delta + offset * (f * delta + 1)) * decay + g
			self._Velocity[index] = (v - (offset * f + v) * (f * delta)) * decay
		elseif d < 1 then
			local c = sqrt(1 - d * d)
			local i = cos(delta * f * c)
			local j = sin(delta * f * c)

			self._CurrentLinearPosition[index] = (offset * i + (v + offset * (d * f)) * j / (f * c)) * decay + g
			self._Velocity[index] = (v * (i * c) - (v * d + offset * f) * j) * (decay / c)
		else
			local c = sqrt(d * d - 1)
			local r1 = -f * (d - c)
			local r2 = -f * (d + c)
			local co2 = (v - offset * r1) / (2 * f * c)
			local co1 = offset - co2
			local e1 = co1 * exp(r1 * delta)
			local e2 = co2 * exp(r2 * delta)

			self._CurrentLinearPosition[index] = e1 + e2 + g
			self._Velocity[index] = r1 * e1 + r2 * e2
		end
	end
end

--[[
	Gets the end goal of the spring object.

    [Learn More](https://luminlabsdev.github.io/ui-framework/api/spring/#get)
]]
function Class.Get(self: Types.Spring): Types.Animatable
	-- Return the unpacked format for improved clarity
	return self._DataType.FromLinear(self._CurrentLinearPosition)
end

--[[
	Destroys the spring object.

    [Learn More](https://luminlabsdev.github.io/ui-framework/api/spring/#destroy)
]]
function Class.Destroy(self: Types.Spring)
	(self :: any)._State:Destroy()
	Utils.CleanMetatable(self :: any)
end

--[=[
	Creates a new spring with a set goal.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#spring)
]=]
return function(goal: Types.State, damping: number?, frequency: number?): Types.SpringExport
    Debugger.Assert(Is.Constructor(goal :: any), "InvalidType", "State", type(goal))
	local Type = Storage.AnimatableDataTypes[typeof((goal :: any):Get())]
    Debugger.Assert(Type, "NotAnimatable", type((goal :: any):Get()))

	local self = setmetatable({}, { __index = Class })

	self._Type = "spring"
	self._Damping = damping or 1
	self._Frequency = frequency or 1
	self._State = goal

	self._DataType = Type
	self._CurrentLinearPosition = Type.ToLinear((goal :: any):Get())

	self._Velocity = table.create(#self._CurrentLinearPosition, 0)

	return self :: any
end
