for _, object in script:GetDescendants() do
	if object:IsA("ModuleScript") and (object.Parent :: any).Name == "docs" then
		(require)(object)
	end
end
