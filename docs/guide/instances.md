# New Instances

Creating new instances is a very straightforward process. UI provides a `New` function for this purpose, which will apply default properties, and the ones you passed into instance.

```luau
local UI = require(path.to.UI)

local Element = UI.New("TextLabel")({
    Parent = ...
    Text = "This is a textlabel"
})

print(Element.Text) --> This is a textlabel
```


## Usage

The syntax in the first example doesn't look too great... and this can be solved by not using parentheses at all! The way the `New` function is set up, you can choose whether or not to pass your own properties. Let's rewrite the example to use a better syntax rule.

*This new syntax will be used for the rest of the guides*

::: code-group
```luau [Properties]
...
local New = UI.New
local Element = New "TextLabel" {
    Parent = ...
    Text = "This is a textlabel"
}
```

```luau [No Properties]
...
local New = UI.New
local Element = New "TextLabel" -- Default props only
```
:::


## Children

The way children are passed into the object hierarchy is a bit different compared to other libraries. Instead of using a separate children key or children table, UI allows you to embed all of your children into the props table at once. Take a look at this extended example from above:

```luau
local Element = New "TextLabel" {
    Parent = ...
    Text = "This is a textlabel"
    New "UICorner" {
        CornerRadius = UDim.new(10, 0)
    }
}
```

This will give our `TextLabel` a bit of styling by applying a smaller corner radius.

## Defaults

The default properties on Roblox aren't ideal for most cases. These are outdated and change very obscure styles in the UI which are often overlooked. To combat this, default properties are applied every time a new instance is created. You can view them [here.](https://github.com/lumin-org/ui/blob/main/src/defaults.luau)
