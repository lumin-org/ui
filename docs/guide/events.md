# Events

The `Event` action allows you to connect a callback to an event, and optionally pass a scope for later cleanup.

## Usage

To connect an event, provide the name of the event and your desired callback.

```luau
local UI = require(path.to.UI)
local Event = UI.Event
local New = UI.New

New "TextButton" {
    Parent = ...,
    Event("Activated", function()
        print("Button clicked!")
    end),
}
```

If you need to clean up the event before the instance is destroyed, you can use a `scope` table to store the event connection in:

```luau
...
local Connections = {}
New "TextButton" {
    Parent = ...,
    Event("Activated", function()
        print("Button clicked!")
    end, Connections),
}

task.wait(10) -- After 10 seconds, make the button no longer clickable
Connections[1]:Disconnect()
...
```
