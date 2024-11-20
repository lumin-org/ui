-- Variables
local Root = script.Parent.Parent
local Debugger = require(Root.Parent.debugger)
local Utility = require(Root.Utility)
local Is = require(Root.Is)
local Types = require(Root.Types)

local Class = {}

-- Functions

--[=[
	Gets the current value of a value object for use within the compute.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/compute/#use)
]=]
local function use(value: Types.Constructor<any> | any)
	if Is.Constructor(value) then
		return (value :: Types.Constructor<any>):Get()
	else
		return value
	end
end

local function ListenerFunction(self: Types.Compute)
	return function()
		self._Result = self._Processor(use)

		if self._Instances ~= nil then
			for prop, instance in self._Instances do
				(instance :: any)[prop] = self._Result
			end
		end
	end
end

--[=[
	Gets the current value of the compute object.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/compute/#get)
]=]
function Class.Get(self: Types.Compute): any
	return self._Result
end

function Class._Bind(self: Types.Compute, prop: string, instance: Instance)
	if self._Instances == nil then
		self._Instances = {}
	end

	(self._Instances :: {})[prop] = instance;
	(instance :: any)[prop] = self._Result
end

--[=[
	Destroys the compute object.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/compute/#destroy)
]=]
function Class.Destroy(self: Types.Compute): nil
	if self._Dependencies then
		for dependency, disconnect in self._Dependencies do
			disconnect()
			self._Dependencies[dependency] = nil
		end
	end

	Utility.CleanMetatable(self :: any)

	return nil
end

-- Module

--[=[
	Creates a new compute which is similar to a value but will compute the value on change.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#compute)
]=]
return function(
	processor: (get: typeof(use)) -> (),
	dependencies: { Types.State | Types.Spring | Types.Constructor<any> }?
): Types.ComputeExport
	local Dependencies = nil :: { [Types.State | Types.Spring | Types.Constructor<any>]: () -> () }?
	local self = setmetatable({}, { __index = Class })

	self._Type = "compute"
	self._Processor = processor
	self._Dependencies = Dependencies
	self._Result = self._Processor(use)
	self._Instances = {}

	if dependencies then
		local TypeOfDependencies = type(dependencies)

		if TypeOfDependencies == "table" then
			Dependencies = {
				-- [State]: DisconnectListenerFunction,
			} :: {}

			for _, v in dependencies do
				if Is.Constructor(v :: any) then
					if (v :: Types.Constructor<any>)._Type == "state" then
						(Dependencies :: {})[v] = (v :: any):Listen(ListenerFunction(self :: any))
					elseif (v :: Types.Constructor<any>)._Type == "spring" then
						(Dependencies :: {})[v] = (v :: any)._State:Listen(ListenerFunction(self :: any))
					else
						Debugger.Warn("ConstructorNotSupported", v._Type)
					end
				end
			end
		else
			Debugger.Warn("TypeMismatch", "table", TypeOfDependencies)
		end
	end

	return self :: any
end
