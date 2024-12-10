-- Variables
local Packages = script.Parent
local Instances = script.Instances
local Animation = script.Animation
local State = script.State
local Keys = script.Keys

local Types = require(script.Types)
local Debugger = require(Packages.debugger)

-- Types
export type Key = Types.Key
export type State = Types.State
export type Spring = Types.Spring
export type Compute = Types.Compute
export type Animatable = Types.Animatable
export type Component<T> = Types.Component<T>

-- Module
Debugger.SetMetadata({
    PackageURL = "https://github.com/luminlabsdev/ui-framework",
    PackageName = "UI Framework",
})

return table.freeze({
	New = require(Instances.New),
    Update = require(Instances.Update),

	State = require(State.State),
    Compute = require(State.Compute),

	Spring = require(Animation.Spring),

    Event = require(Keys.Event),
    Change = require(Keys.Change),
    Tag = require(Keys.Tag),
    Clean = require(Keys.Clean),
})
