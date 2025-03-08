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
		for _, func in self._Listeners :: { (changed: any) -> () } do
			task.spawn(func, Value)
		end
	end

	return self._Value
end

-- Functions

function Class._Bind(self: Types.State<any>, prop: string, instance: Instance)
	if type((self :: any)._Value) ~= "table" then
		(instance :: any)[prop] = self._Value; -- Set the prop initially to the current value
		(self :: any):Listen(function(new)
			(instance :: any)[prop] = new -- Change the prop to the new value when the state is changed
		end)
	end
end

--[=[
	Listens to changes of state within the object.

	[Open Documentation](https://lumin-org.github.io/ui/api/state/#listen)
]=]
function Class.Listen(self: Types.State<any>, listener: (changed: any) -> ()): () -> ()
	table.insert((self :: any)._Listeners :: { () -> () }, listener) -- Add listener
	return function() -- Disconnect the listener
		local Listener = table.find((self :: any)._Listeners, listener)
		if Listener then
			table.remove((self :: any)._Listeners, Listener)
		end
	end
end

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
	self._Listeners = {}
	self._Type = "State"

	return self :: any
end
