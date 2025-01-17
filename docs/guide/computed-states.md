# Computed States

Computed states are quite similar to states, in the fact that they can dynamically change properties in your UI. The main difference here is that, whenever a dependency of the computed state is changed, the computed state will be recalculated to retrieve the new final value.

## Usage

Computed states take in a table of state depedencies. This is because the final result of the computed depends on at least one state to change in order to fulfill the request.

```luau
local UI = require(path.to.UI)
local New = UI.New
local Compute = UI.Compute
local State = UI.State

local Dependency = State(100)
local ComputedValue = Compute(function()
    return Dependency:Get() * 3
end, {Dependency})

print(ComputedValue) --> 300
Dependency:Set(200)
print(ComputedValue) --> 600
```

::: info
Unlike libraries such as Fusion, UI chose a dependency-based approach so developers can better see what their computed value is using.
:::

You can also computeds for other cases, but they are pretty much useless without states being present.
