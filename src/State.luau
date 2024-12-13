-- Variables
local Root = script.Parent
local Types = require(Root.Types)
local Debugger = require(Root.Parent.roblox_packages.debugger)

local Class = {}

-- Functions

--[=[
	Returns the current value of the object.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/state/#get)
]=]
function Class.Get(self: Types.State): any
	return self._State
end

--[=[
	Sets the current value of the object.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/state/#set)
]=]
function Class.Set<T>(self: Types.State, newValue: T): T
	local Type = type(newValue)

	if Type == "table" then
		Debugger.Warn("RestrictedType", Type)
		return newValue
	end

	local OldValue = self._State

	-- Normal checks
	if self._State == newValue then
		return newValue
	end

	-- Setting the actual value and triggering the listeners
	self._State = newValue

	-- Loop through the listeners table and call every function each of them have.
	for _, fn in self._Listeners do
		task.spawn(fn, newValue, OldValue)
    end

	return newValue
end

--[=[
	Listens to changes of state within the object.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/state/#listen)
]=]
function Class.Listen(self: Types.State, listener: (new: any, old: any) -> ()): () -> ()
	table.insert(self._Listeners, listener) -- Add a listener

	-- Disconnecting function
	return function()
		local FoundListener = table.find(self._Listeners, listener)

		if FoundListener then
			table.remove(self._Listeners, FoundListener)
		else
			Debugger.Warn("CannotFindIndex", "State:Listen(...)")
			return
		end
	end
end

function Class._Bind(self: Types.State, prop: string, instance: Instance)
	(instance :: any)[prop] = self._State

	;(self :: any):Listen(function(newValue)
		(instance :: any)[prop] = newValue
	end)
end

--[=[
	Destroys the value object.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/state/#destroy)
]=]
function Class.Destroy(self: Types.State)
	table.clear(self :: any)
	setmetatable(self :: any, nil)
end

-- Module

--[=[
	Creates a new value/state object that dynamically changes in UI when changed itself.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#state)
]=]
return function(initial: any): Types.StateExport
	local Type = type(initial)

	if Type == "table" then
		Debugger.Warn("RestrictedType", Type)
		initial = initial or nil
	end

	local self = setmetatable({}, { __index = Class })

	self._Type = "state"
	self._State = initial
	self._Listeners = {}

	return self :: any
end
