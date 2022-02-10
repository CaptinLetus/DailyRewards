local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)

return function(props)
	return Roact.createElement("TextButton", {
		Font = Enum.Font.GothamBlack,
		Text = "",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextScaled = true,
		TextSize = 14,
		TextWrapped = true,
		AnchorPoint = Vector2.new(0.5, 1),
		BackgroundColor3 = Color3.fromRGB(35, 203, 41),
		Position = UDim2.fromScale(0.5, 0.95),
		Size = UDim2.fromScale(0.3, 0.15),
		Visible = false,
		ZIndex = 2,
	}, {
		uICorner = Roact.createElement("UICorner", {
			CornerRadius = UDim.new(0, 10),
		}),
		uIStroke = Roact.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(18, 116, 21),
			Thickness = 5,
		}),
		price = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = "Claim",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 14,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.8, 0.8),
		}),
		sFX = Roact.createElement("Sound", {
			SoundId = "rbxassetid://7816854085",
		}),
	})
end
