-- Variables
local Types = require("./types")
local Debugger = require("../roblox_packages/debugger")
local Is = require("./is")

local DependencyTypes = {
	"State",
	"Compute",
	"Spring",
}

-- Module

--[=[
    Runs the provided callback whenever one of the dependencies updates.

	[Open Documentation](https://lumin-org.github.io/ui/api/#effect)
]=]
return function(processor: () -> (), dependencies: { Types.State<any> })
    for _, dependency in dependencies do
		if table.find(DependencyTypes, Is(dependency)) then
			table.insert(((dependency :: any)._Observers) :: { (changed: any) -> () }, processor)
		else
			Debugger.fatal("InvalidType", "state", type(dependency))
		end
	end
end
