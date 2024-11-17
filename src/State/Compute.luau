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
local function use(value: Types.Constructor | any)
	if Is.Constructor(value) then
		return (value :: Types.Constructor):Get()
	else
		return value
	end
end

local function ListenerFunction(self: Types.Compute)
	return function()
		self._result = self._processor(use)

		if self._instances ~= nil then
			for prop, instance in self._instances do
				(instance :: any)[prop] = self._result
			end
		end
	end
end

--[=[
	Gets the current value of the compute object.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/compute/#get)
]=]
function Class.Get(self: Types.Compute): any
	return self._result
end

function Class._Bind(self: Types.Compute, prop: string, instance: Instance)
	if self._instances == nil then
		self._instances = {}
	end

	(self._instances :: {})[prop] = instance;
	(instance :: any)[prop] = self._result
end

--[=[
	Destroys the compute object.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/compute/#destroy)
]=]
function Class.Destroy(self: Types.Compute): nil
	if self._dependencies then
		for dependency, disconnect in self._dependencies do
			disconnect()
			self._dependencies[dependency] = nil
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
	dependencies: { Types.State | Types.Spring | Types.Constructor }?
): Types.Compute
	local Dependencies = nil :: { [Types.State | Types.Spring | Types.Constructor]: () -> () }?
	local self = setmetatable({} :: Types.ComputeProps, { __index = Class } :: { __index: Types.ComputeFunc })

	self.ConstructorClass = "compute"
	self._processor = processor
	self._dependencies = Dependencies
	self._result = self._processor(use)
	self._instances = {}

	if dependencies then
		local TypeOfDependencies = type(dependencies)

		if TypeOfDependencies == "table" then
			Dependencies = {
				-- [State]: DisconnectListenerFunction,
			} :: {}

			for _, v in dependencies do
				if Is.Constructor(v :: any) then
					if (v :: Types.Constructor)._Type == "state" then
						(Dependencies :: {})[v] = (v :: Types.State):Listen(ListenerFunction(self))
					elseif (v :: Types.Constructor)._Type == "spring" then
						(Dependencies :: {})[v] = (v :: Types.Spring)._state:Listen(ListenerFunction(self))
					else
						Debugger.Warn("ConstructorNotSupported", v._Type)
					end
				end
			end
		else
			Debugger.Warn("TypeMismatch", "table", TypeOfDependencies)
		end
	end

	return self
end
