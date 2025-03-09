# States

States allow you to store values that are dynamically changed within your UI. You can write to them by calling them with arguments and listen for changes using `Listen`.

## Usage

Since states are the most simple object in the entire UI framework, all you need to do is provide an initial value. We can use our previous example from the `Cleanup` page like so:

```luau
local UI = require(path.to.UI)
local New = UI.New
local State = UI.State

local ElementState = State("Hi")
local Element = New "TextLabel" {
    Parent = ...
    Text = ElementState
})

print(Element.Text) --> Hi
ElementState("Hi, again")
print(Element.Text) --> Hi, again
```

For optimization purposes, nothing will happen if you set the state to the previous value it was. You can also retrieve the value of the state by calling it with no arguments:

```luau
local UI = require(path.to.UI)
local New = UI.New
local State = UI.State

local MyState = State("Hi")
print(MyState()) --> Hi
```

Along with this, it's also possible to listen to changes. As mentioned before though, the listener will not be run if you set the state's value to the same one as it previously was.

```luau
local UI = require(path.to.UI)
local New = UI.New
local State = UI.State

local MyState = State("Hi")
MyState:Listen(function(new)
    print(new) --> Hi, again
end)

MyState("Hi, again")
```
