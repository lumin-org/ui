# Cleanup

The `Cleanup` action allows you to clean up items that may have been left over from other parts of the UI. If the item has a `Destroy` or `Disconnect` method, it can be cleaned by this.

## Usage

Whenever its parent instance is destroyed, the cleanup action is called. This way, we can cleanup unused states, springs, or external connections that will no longer be used. Here's an example where we want to create temporary states for an interface.

```luau
local UI = require(path.to.UI)
local New = UI.New
local Cleanup = UI.Cleanup
local State = UI.State

local ElementState = State("Hi")
local Element = New "TextLabel" {
    Parent = ...,
    Text = ElementState,
    
    Cleanup({ElementState}),
}

task.wait(5)
Element:Destroy()
print(ElementState) --> nil
```
