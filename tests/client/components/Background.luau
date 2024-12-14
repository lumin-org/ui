-- SERVICES >
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- FOLDERS >
local Package = ReplicatedStorage["ui-framework"]

-- DEPENDENCIES >
local Framework = require(Package.src)

-- VARIABLES >
local New = Framework.New

type Background = {
	Color: Color3,
	Position: any?,
	Size: UDim2?,
    Text: any?,
}

return function(props: Background)
	return New("Frame", {
		BackgroundColor3 = props.Color,
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = props.Size or UDim2.fromScale(0.5, 0.5),
		ZIndex = 2,

        New("TextLabel", {
			Text = props.Text,
            BackgroundColor3 = Color3.fromRGB(128, 95, 95),
			Position = UDim2.fromScale(0.5, 0.5),
			ZIndex = 3,
		}),
	})
end
