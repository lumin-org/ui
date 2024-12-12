-- SERVICES >
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- FOLDERS >
local Package = ReplicatedStorage["ui-framework"]

-- DEPENDENCIES >
local Framework = require(Package.src)
local MyComponent = require(script.Parent.components.Background)

-- VARIABLES >
local Player = Players.LocalPlayer
local New = Framework.New
local State = Framework.State("Hello")
local Goal = Framework.State(UDim2.fromScale(0.5, 1))
local Spring = Framework.Spring(Goal :: any, 0.5, 5)
local c = 1

-- UI
New("ScreenGui", {
	Name = "MenuUI",
	IgnoreGuiInset = true,
	Parent = Player:WaitForChild("PlayerGui"),
}, {
	Background = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		ZIndex = 1,
	}),
	ComponentBackgroundChildren = New(MyComponent, {
		Color = Color3.fromRGB(151, 71, 71),
		Position = Spring :: any,
	}, {
		New("TextLabel", {
			Text = State,
            BackgroundColor3 = Color3.fromRGB(128, 95, 95),
			Position = UDim2.fromScale(0.5, 0.5),
			ZIndex = 3,
		}),
	}),
	ComponentBackground = New(MyComponent, {
		Color = Color3.fromRGB(103, 196, 246),
		Position = UDim2.fromScale(0.5, 0.1),
	}),
    New("TextButton", {
        [Framework.Event "Activated"] = function()
            c+=1
            State:Set(`Hello {c}`)
            Goal:Set(UDim2.fromScale(0.5, if c%2 == 0 then 1 else 1.5))
        end,

        [Framework.Change "Name"] = function(new_name: any)
            print(new_name)
        end,

        Text = "Test",
        Position = UDim2.fromScale(0.5, 0.2),
        Size = UDim2.fromOffset(100, 100),
        ZIndex = 3,
    }),
})

task.wait(10)
State:Set("TEST!!!")
