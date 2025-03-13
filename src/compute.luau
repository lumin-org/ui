-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local Is = require("./is")

local Class = {}
Class.__index = Class
Class.__call = function(self)
	return self._Value
end

local DependencyTypes = {
	"State",
	"Compute",
	"Spring",
}

-- Functions

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
return function<T>(processor: () -> T, dependencies: { Types.State<any> }): Types.Compute<T>
	local self = setmetatable({}, Class)

	self._Value = processor()
	self._Observers = {} :: { (changed: any) -> () }
	self._Processor = processor
	self._Type = "Compute"

	Debugger.assert(type(dependencies) == "table", "InvalidType", "table", type(dependencies))
	for _, dependency in dependencies do
		if table.find(DependencyTypes, Is(dependency)) then
			table.insert(((dependency :: any)._Observers) :: { (changed: any) -> () }, function()
				self._Value = processor()
				for _, observer in self._Observers do
					observer(self._Value)
				end
			end)
		else
			Debugger.fatal("InvalidType", "state", type(dependency))
		end
	end

	return self :: any
end
