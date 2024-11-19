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

	local TargetLinearPosition = self._type.ToLinear(self._State:Get())
	local CurrentValue = self._State:Get()

	if CurrentValue ~= nil then
		(instance :: any)[prop] = CurrentValue
	end
	self._CurrentLinearPosition = TargetLinearPosition

	;(self._State :: any):Listen(function(newValue)
		TargetLinearPosition = self._type.ToLinear(newValue)

		if Connection ~= nil then
			return -- The value changed when the spring was playing; don't create another connection, let the new one play
		end

		if not Connection then
			Connection = Scheduler:Add(Mode, function(delta: number)
				if self and (self :: any)._Update then
					(self :: any):_Update(TargetLinearPosition, delta);
					(instance :: any)[prop] = self._type.FromLinear(self._CurrentLinearPosition)
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
	### `Spring:Get()`
	Returns the runtime position of the spring object.

	#### Returns
	- `Position`

	#### Examples
	```luau
	local MyState = Aegis.state(Vector3.new(0, 5, 0))
	local MySpring = Aegis.spring({ State = MyState })
	print(MySpring:Get()) -- 0, 5, 0
	```
]]
function Class.Get(self: Types.Spring): Types.Animatable
	-- Return the unpacked format for improved clarity
	return self._type.FromLinear(self._CurrentLinearPosition)
end

--[[
	### `Spring:Destroy()`
	Destroys and removes the spring.

	#### Returns
	- `nil`

	#### Example
	```luau
	local MySpring = Aegis.spring({ ... })
	MySpring:Destroy() -- spring no longer valid.
	```
]]
function Class.Destroy(self: Types.Spring): nil
	(self :: any)._State:Destroy()
	Utils.CleanMetatable(self :: any)
	return nil
end

--[=[
	Creates a new spring.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#spring)
]=]
return function(springInfo: {
	State: Types.State,
	Damping: number?,
	Frequency: number?,
}): Types.Spring
	-- Checks
	if Is.Constructor(springInfo.State :: any) == false then
		Debugger.Error("TypeMismatch", "Aegis.State", typeof(springInfo.State))
	end

	local Type = Storage.AnimatableDataTypes[typeof(springInfo.State:Get())]

	if not Type then
		Debugger.Error("NotAnimatable", typeof(springInfo.State:Get()))
	end

	local self = setmetatable({} :: Types.SpringProps, { __index = Class } :: { __index: Types.SpringFunc })

	self.ConstructorClass = "spring"

	self._Damping = springInfo.Damping or 1
	self._Frequency = springInfo.Frequency or 1
	self._State = springInfo.State

	self._type = Type
	self._CurrentLinearPosition = self._type.ToLinear(springInfo.State:Get())

	self._Velocity = table.create(#self._CurrentLinearPosition, 0)

	return self
end
