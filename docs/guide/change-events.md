# Change Events

The `Changed` action allows you to see when a property is changed on the parent instance, and optionally pass a scope for later cleanup.

## Usage

To connect a change event, provide the property name and the desired callback to run when that property is changed.

```luau
local UI = require(path.to.UI)
local Changed = UI.Changed
local New = UI.New
local Update = UI.Update

local ToChange = New "TextLabel" {
    Parent = ...
    Text = "Old text",
    Changed("Text", function(new)
        print(`The text changed! New: {new}`)
    end)
}

task.wait(5)

Update(ToChange) {
    Text = "New text"
}

--> The text changed! New: New text
```

If you need to clean up the event before the instance is destroyed, you can use a `scope` table to store the event connection in:

```luau
...
local Connections = {}
local ToChange = New "TextLabel" {
    Parent = ...
    Text = "Old text",
    Changed("Text", function(new)
        print(`The text changed! New: {new}`)
    end, Connections)
}
Connections[1]:Disconnect()
...
```
