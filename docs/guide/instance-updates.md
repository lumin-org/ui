# Instance Updates

Often times when creating UI, it may be tedious to quickly update the properties of an element. To fix such issues, an `Update` function is provided for you which behaves just as `New` does, except it updates an instance instead of creating a new one.

## Usage

For this usage example, we can apply instance updating to the previous example on `New`.

```luau
local UI = require(path.to.UI)
local New = UI.New
local Update = UI.Update

local Element = New "TextLabel" {
    Parent = ...,
    Text = "This is a textlabel",
}

print(Element.Text) --> This is a textlabel

Update(Element) {
    Text = "This is a textlabel... kind of!",
}

print(Element.Text) --> This is a textlabel... kind of!
```
