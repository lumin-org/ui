-- Variables
local Packages = script.Parent.roblox_packages
local Types = require(script.types)
local Logs = require(script.logs)
local Debugger = require(Packages.debugger)

-- Types
export type Action = Types.Action
export type State = Types.State
export type Spring = Types.Spring
export type Compute = Types.Compute
export type Animatable = Types.Animatable

-- Module
Debugger.set({
    Logs = Logs,
	URL = "https://lumin-org.github.io/ui/guide/errors#",
	Name = "UI",
})

return table.freeze({
	New = require(script.new),
	Update = require(script.update),
	State = require(script.state),
	Compute = require(script.compute),
	Spring = require(script.spring),
	Cleanup = require(script.cleanup),
	Event = require(script.event),
	Changed = require(script.changed),
	Tags = require(script.tags),
    ForEach = require(script.foreach)
})
