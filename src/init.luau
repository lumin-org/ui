-- Variables
local Packages = script.Parent.roblox_packages
local Types = require(script.Types)
local Debugger = require(Packages.debugger)

-- Types
export type Action = Types.Action
export type State = Types.State
export type Spring = Types.Spring
export type Compute = Types.Compute
export type Animatable = Types.Animatable

-- Module
Debugger.SetMetadata({
    PackageURL = "https://github.com/luminlabsdev/ui-framework",
    PackageName = "UI Framework",
})

return table.freeze({
	New = require(script.New),
    Update = require(script.Update),

	State = require(script.State),
    Compute = require(script.Compute),

	Spring = require(script.Spring),

    Action = require(script.Action),
    Event = require(script.Event),
    Changed = require(script.Changed),
    Tags = require(script.Tags),
    Clean = require(script.Clean),
})
