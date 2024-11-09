-- Variables
local Root = script.Parent.Parent
local Utility = Root.Utility
local Packages = script.Parent.Parent.Parent.Parent.Packages

local Debugger = require(Packages.debugger)
local Utils = require(Utility.Utils)
local Types = require(Root.Types)
local Default = require(Root.Instances.Default)

-- Module

--[=[
	Creates a new instance or component with the provided children and props.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#new)
]=]
return function<T>(
	component: string | Types.Component<T>,
	properties: (T & Types.Properties)?,
	children: Types.Children?
): Instance
	local Component
	if type(component) == "string" then
		local Success, Result = pcall(Instance.new, component) -- Create the instance wrapped inside pcall

		if Success then
            if Default[component] then
                for prop, value in Default[component] do
                   (Result :: any)[prop] = value
                end
            end

			if properties then
				for property, value in properties :: any do
					if property == "Parent" then
						continue
					end

					Utils.ApplyProperty(Result, property, value)
				end

				if (properties :: any).Parent then
					Utils.ApplyProperty(Result, "Parent", (properties :: any).Parent)
				end
			end

			if children then
				for name, value in children do
					value.Parent = Result
					value.Name = if type(name) == "string" then name else value.Name
				end
			end

			Component = Result
		else -- If it wasn't successful, error it because instance creation has to be complete.
			Debugger.Fatal("FailedCreation", component, Result)
		end
	else
		if children then
			if not properties then
				properties = {} :: any
			end
			(properties :: any).Children = children
		end

		Component = component(properties :: any)
	end
	return Component
end
