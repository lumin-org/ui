# For Each

The `ForEach` action allows you to create a piece of UI for every entry within a table. By default, in the processor function, it gives the `index` and `value` arguments respectively. These can be used to do repetitve tasks with tables, such as creating a list of buttons using a table.

## Usage

In this example, we have a lot of donation amounts that would be innefficient to create manually.

```luau
local UI = require(path.to.UI)
local ForEach = UI.ForEach
local New = UI.New

local DonationAmounts = {
    100,
    200,
    300,
    400,
    500,
}

New "Frame" {
    Parent = ...,
    ForEach(DonationAmounts, function(index, value)
        return New "TextButton" {
            Text = `{index}: {value}`
            ...
        }
    end),
}
```

In the end, we get a frame that has 5 different buttons for each donation amount. Returning an instance when using `ForEach` results in it being parented to the instance the action is used on.
