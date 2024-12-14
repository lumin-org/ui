-- Variables
local Root = script.Parent
local Debugger = require(Root.Parent.roblox_packages.debugger)
local Types = require(Root.Types)

local Spr = require(script.Parent.Spr)

local Class = {}
local Animatable = {
	"boolean",
	"number",
	"NumberRange",
	"UDim",
	"UDim2",
	"Vector2",
	"Vector3",
	"Color3",
	"ColorSequence",
	"NumberSequence",
	"CFrame",
}

-- Functions

function Class._Bind(self: Types.Spring, prop: string, instance: Instance)
	(instance :: any)[prop] = self._Goal:Get()
    table.insert(self._Instances, instance)
	self._Goal:Listen(function(new)
		Spr.target(instance, self._Damping, self._Frequency, {
			[prop] = new,
		})
	end)
end

--[[
	Stops the current spring from moving, leaving it at its current position.

    [Learn More](https://luminlabsdev.github.io/ui-framework/api/spring/#stop)
]]
function Class.Stop(self: Types.Spring)
    if self._Instances then
        for _, instance in self._Instances do
            Spr.stop(instance)
        end
    end
end

--[[
	Gets the end goal of the spring.

    [Learn More](https://luminlabsdev.github.io/ui-framework/api/spring/#get)
]]
function Class.Get(self: Types.Spring): Types.Animatable
	return self._Goal:Get()
end

--[[
	Destroys the spring object.

    [Learn More](https://luminlabsdev.github.io/ui-framework/api/spring/#destroy)
]]
function Class.Destroy(self: Types.Spring)
	(self :: any)._Goal:Destroy()
	table.clear(self :: any)
	setmetatable(self :: any, nil)
end

--[=[
	Creates a new spring with a set goal.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#spring)
]=]
return function(goal: Types.State, damping: number?, frequency: number?): Types.SpringExport
	Debugger.Assert(table.find(Animatable, typeof((goal :: any):Get())), "NotAnimatable", typeof((goal :: any):Get()))
	Debugger.Assert(type(goal) == "table" and goal._Type == "State", "InvalidType", "State", type(goal))

	local self = setmetatable({}, { __index = Class })

    self._Type = "Spring"
	self._Damping = damping or 1
	self._Frequency = frequency or 1
    self._Instances = {}
	self._Goal = goal

	return self :: any
end
