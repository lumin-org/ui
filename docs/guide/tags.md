# Tags

Tags allow you to micro manage instances at a higher level, and the `Tag` action will apply the given tags to the instance it's parented to.

## Usage

To apply a singular tag, you can do the following:

```luau
local UI = require(path.to.UI)
local Tags = UI.Tags
local New = UI.New

New "TextButton" {
    Parent = ...,
    Tags("OneTag"),
}
```

If you need multiple, however, you can apply a space between each tag entry:

```luau
...
New "TextButton" {
    Parent = ...,
    Tags("OneTag TwoTag ThreeTag FourTag"),
}
```


