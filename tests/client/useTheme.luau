if not plugin then
	return
end

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Studio = settings().Studio

-- // Folders
local Packages = ReplicatedStorage.Packages

-- // Dependencies
local Framework = require(Packages["ui-framework"])

-- // Variables
local StudioTheme = Framework.Value(Studio.Theme)

-- // Event Listeners
Studio.ThemeChanged:Connect(function()
	StudioTheme:Set(Studio.Theme)
end)

-- // Returning
return StudioTheme
