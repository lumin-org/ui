-- Variables
local Packages = script.Parent.Parent.Parent
local UI = require(Packages.ui.src)
local New = UI.New
local Spring = UI.Spring
local Compute = UI.Compute
local State = UI.State
local View = UI.View

local SpringState = State(0.25)
local SpringCompute = Compute(function()
	return UDim2.fromScale(0.5, SpringState())
end, { SpringState :: any })
local TestSpring = Spring(SpringCompute :: any, 0.5, 2)

View {
	New "Frame" {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(100, 100),
		Position = TestSpring,
	},
}

task.spawn(function()
	while true do
		task.wait(1)
		SpringState(0.75)
		task.wait(1)
		SpringState(0.25)
	end
end)

return {}
