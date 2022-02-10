local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)

return function()
	return Roact.createElement("Frame", {
		BackgroundColor3 = Color3.fromRGB(224, 248, 255),
		Size = UDim2.fromScale(0.16, 1),
	}, {
		uICorner = Roact.createElement("UICorner", {
			CornerRadius = UDim.new(0.2, 0),
		}),
		frame = Roact.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 1),
			BackgroundColor3 = Color3.fromRGB(182, 232, 246),
			Position = UDim2.fromScale(0.5, 0.95),
			Size = UDim2.fromScale(0.9, 0.6),
		}, {
			uICorner1 = Roact.createElement("UICorner", {
				CornerRadius = UDim.new(0.2, 0),
			}),
			imageLabel = Roact.createElement("ImageLabel", {
				Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
				ScaleType = Enum.ScaleType.Fit,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(0.9, 0.9),
			}),
		}),
		textLabel = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = "Day 2",
			TextColor3 = Color3.fromRGB(46, 118, 172),
			TextScaled = true,
			TextSize = 14,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.05),
			Size = UDim2.fromScale(0.7, 0.25),
		}),
	})
end
