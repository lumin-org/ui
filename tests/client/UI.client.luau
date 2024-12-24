-- Variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Package = ReplicatedStorage.ui

local UI = require(Package.src)
local MyComponent = require(script.Parent.components.Background)

local Player = Players.LocalPlayer
local New = UI.New
local Event = UI.Event
local Changed = UI.Changed
local State = UI.State("Hello")
local Goal = UI.State(UDim2.fromScale(0.5, 1))
local Spring = UI.Spring(Goal :: any, 0.5, 5)
local c = 1

-- UI
New "ScreenGui" {
	Name = "MenuUI",
	IgnoreGuiInset = true,
	Parent = Player:WaitForChild("PlayerGui"),

    New "Frame" {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		ZIndex = 1,
	},

    MyComponent {
		Color = Color3.fromRGB(151, 71, 71),
		Position = Spring,
        Text = State,
	},

	MyComponent {
		Color = Color3.fromRGB(103, 196, 246),
		Position = UDim2.fromScale(0.5, 0.1),
	},

    New "TextButton" {
        Event("MouseEnter", function()
            print("Entered for this other one...")
        end),

        Text = "This other one",
        Position = UDim2.fromScale(0.2, 0.2),
        Size = UDim2.fromOffset(100, 100),
        ZIndex = 3,
    },

    New "TextButton" {
        Event("Activated", function()
            c+=1
            State:Set(`Hello {c}`)
            Goal:Set(UDim2.fromScale(0.5, if c%2 == 0 then 0.9 else 0.6))
        end),

        Event("MouseEnter", function()
            print("Entered for this one...")
        end),

        Changed("Name", function(new: any)
            print(new)
        end),

        Text = State,
        Position = UDim2.fromScale(0.5, 0.2),
        Size = UDim2.fromOffset(100, 100),
        ZIndex = 3,
    },
}

task.wait(10)
State:Set("TEST!!!")
