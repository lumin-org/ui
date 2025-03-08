-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local Is = require("./is")

local Class = {}
Class.__index = Class
Class.__call = function(self)
	return self._Value -- Get processed value
end

-- Functions

function Class._Bind(self: Types.Compute<any>, prop: string, instance: Instance)
	if type((self :: any)._Value) ~= "table" then
		(instance :: any)[prop] = self._Value; -- Set the prop initially to the current value
		(self :: any):Listen(function(new)
			(instance :: any)[prop] = new -- Change the prop to the new value when the state is changed
		end)
	end
end

--[=[
	Listens to changes of state within the object.

	[Open Documentation](https://lumin-org.github.io/ui/api/compute/#listen)
]=]
function Class.Listen(self: Types.Compute<any>, listener: (changed: any) -> ()): () -> ()
	table.insert((self :: any)._Listeners :: { () -> () }, listener) -- Add listener
	return function() -- Disconnect the listener
		local Listener = table.find((self :: any)._Listeners, listener)
		if Listener then
			table.remove((self :: any)._Listeners, Listener)
		end
	end
end

--[=[
	Destroys the compute object, but not the state dependencies.

	[Open Documentation](https://lumin-org.github.io/ui/api/compute/#destroy)
]=]
function Class.Destroy(self: Types.Compute<any>)
	table.clear(self :: any)
	setmetatable(self :: any, nil)
end

-- Module

--[=[
	Creates a new computed value, which changes the final value when a dependency is changed.

	[Open Documentation](https://lumin-org.github.io/ui/api/#compute)
]=]
return function<T>(processor: () -> T, dependencies: { Types.State<any> }): Types.Compute<any>
	local self = setmetatable({}, Class)

	self._Processor = processor
	self._Value = processor()
	self._Listeners = {}
	self._Dependencies = {} :: any
	self._Type = "Compute"

	if dependencies then
		Debugger.assert(type(dependencies) == "table", "InvalidType", "table", type(dependencies))
		for _, dependency in dependencies do
			if Is(dependency) == "State" then
				(self._Dependencies :: any)[dependency] = (dependency :: any):Listen(function()
					-- Set the value of the computed state to the new processed value
					self._Value = self._Processor()
					-- Run all listeners when the value is changed
					for _, func in self._Listeners :: { (changed: any) -> () } do
						task.spawn(func, self._Value)
					end
				end)
			else
				Debugger.fatal("InvalidType", "state", type(dependency))
			end
		end
	end

	return self :: any
end
