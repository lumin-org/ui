-- Variables
local Types = require("./types")

local Class = {}
Class.__index = Class
Class.__call = function<T>(self, ...: T): T
	-- If there is an argument, then evalute
	-- thanks vide :D
	if select("#", ...) == 1 then
		local Value: any = ...
		-- Don't waste resources if new value is the same as old
		if self._Value == Value and (type(Value) ~= "table" or table.isfrozen(Value :: any)) then
			return Value
		end

		self._Value = Value

		-- Run all listeners when the value is changed
		for _, observer in self._Observers do
			observer(Value)
		end
	end

	return self._Value
end

-- Functions

--[=[
	Destroys the value object.

	[Open Documentation](https://lumin-org.github.io/ui/api/state/#destroy)
]=]
function Class.Destroy(self: Types.State<any>)
	table.clear(self :: any)
	setmetatable(self :: any, nil)
end

-- Module

--[=[
	Creates a new value/state object that dynamically changes in UI when changed itself.

	[Open Documentation](https://lumin-org.github.io/ui/api/#state)
]=]
return function<T>(initial: T): Types.State<T>
	local self = setmetatable({}, Class)

	self._Value = initial
	self._Observers = {}
	self._Type = "State"

	return self :: any
end
