-- Variables
local Root = script.Parent
local Types = require(Root.Types)
local Actions = {}

-- Functions

--[=[
	Creates a new action, which allows for custom modifications to instances.

	[Learn More](https://luminlabsdev.github.io/ui-framework/api/#action)
]=]
return function(name: string, apply: (Instance) -> ()): Types.Action
    if not Actions[name] then
        Actions[name] = apply
    end
    return Actions[name]
end
