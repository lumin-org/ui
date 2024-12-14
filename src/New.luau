-- Variables
local Root = script.Parent
local Apply = require(Root.Apply)
local Debugger = require(Root.Parent.roblox_packages.debugger)
local Defaults = require(Root.Defaults)

-- Module

--[=[
	Clones or creates a new isntance with the provided properties. Default properties are not
    set on clones.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#new)
]=]
return function(class: string | Instance, props: { any }?): Instance
	Debugger.Assert(type(class) == "string" or typeof(class) == "Instance", "FailedCreation", class, "")

	local Success, New

	if type(class) == "string" then
		Success, New = pcall(Instance.new, class)
	else
		Success, New = true, class:Clone()
	end

	if Success then
		if type(class) == "string" and Defaults[class] then
			for prop, value in Defaults[class] do
				(New :: any)[prop] = value
			end
		end

		if props then
			for prop, value in props :: any do
				if prop == "Parent" then
					continue
				end
				Apply(New, prop, value)
			end

			if (props :: any).Parent then
				New.Parent = (props :: any).Parent
			end
		end
	else
		Debugger.Fatal("FailedCreation", class, New)
	end
	return New
end
