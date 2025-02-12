-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")

local Class = {}
Class.__index = Class

-- Functions

local function Listener(self: Types.Compute<any>)
	return function()
		self._Value = self._Processor() -- Set the value of the computed state to the new processed value

		if self._Instances ~= nil then
			for prop, instance in self._Instances do
				(instance :: any)[prop] = self._Value
			end
		end
	end
end

--[=[
	Gets the current value of the compute object.

	[Open Documentation](https://lumin-org.github.io/ui/api/compute/#get)
]=]
function Class.Get(self: Types.Compute<any>): any
	return self._Value
end

function Class._Bind(self: Types.Compute<any>, prop: string, instance: Instance)
	(self._Instances :: {})[prop] = instance;
	(instance :: any)[prop] = self._Value
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
return function(processor: () -> (), dependencies: { Types.State<any> }?): Types.Compute<any>
	local self = setmetatable({}, Class)

	self._Processor = processor
	self._Value = processor()
	self._Instances = {}
	self._Dependencies = {} :: any

	if dependencies then
		Debugger.assert(type(dependencies) == "table", "InvalidType", "table", type(dependencies))
		for _, dependency in dependencies do
			if type(dependency) == "table" and (dependency :: any)._Listeners then
				(self._Dependencies :: any)[dependency] = (dependency :: any):Listen(Listener(self :: any))
			else
				Debugger.fatal("InvalidType", "state", type(dependency))
			end
		end
	end

	return self :: any
end
