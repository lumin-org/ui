# Components

While working with user interface, you may start to realize that creating the same instance over and over again becomes repetitive. Components aim to solve this issue; these function just as creating a new instance would, but you store them within a separate module which returns a function.

## Usage

::: code-group
```luau [component.luau]
local UI = require(path.to.UI)
local New = UI.New

type Props = {
    Color: Color3,
    Label: TextLabel,
    Size: UDim2?,
    Position: UDim2?,
}

return function(props: Props)
    return New "Frame" {
        BackgroundColor3 = props.Color,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BroderSizePixel = 0,
        Position = props.Position or UDim2.fromScale(0.5, 0.5),
        Size = props.Size or UDim2.fromScale(1, 1),

        -- Children
        props.Label
    }
end
```

```luau [init.client.luau]
local UI = require(path.to.UI)
local Component = require(path.to.component)
local New = UI.New

local Main = New "ScreenGui" {
	IgnoreGuiInset = true,
	Parent = Player:WaitForChild("PlayerGui"),
    Background = BackgroundComponent {
		Color = Color3.fromRGB(24, 24, 24),
        Label = New "TextLabel" {
			Text = "Welcome!"
		}
	}
}
```
:::

Component creation is similar to many other popular libraries like Vide, or Fusion.
