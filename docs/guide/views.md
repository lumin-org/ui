# Views

Views are essentially `ScreenGuis` but they are automatically named and parented for you. It is a much more preffered way of creating them, as it makes your code cleaner and more readable.

## Usage

In this usage example, we create a simple and default view with a `TextButton`.

```luau
local UI = require(path.to.UI)
local New = UI.New
local View = UI.View

local MyView = View { -- ScreenGui
    Type = "Screen",
    New "TextButton" {
        Text = "Click me!",
    }
}
```

Note that if you do not provide a type property, the default type is a `ScreenGui`. If the type is a `ScreenGui` and no parent is provided, the default is the `PlayerGui`. 

## View Types

There are three different view types:

- Screen
- Billboard
- Surface
