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
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 68, 68),
		Position = UDim2.fromScale(1, 0),
		Size = UDim2.fromScale(0.15, 0.15),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		[Roact.Event.Activated] = props.OnClose
	}, {
		uICorner = Roact.createElement("UICorner", {
			CornerRadius = UDim.new(0, 20),
		}),
		uIStroke = Roact.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(181, 55, 55),
			Thickness = 5,
		}),
		textLabel = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = "X",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 14,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 0.7),
		}, {
			uIStroke1 = Roact.createElement("UIStroke", {
				Thickness = 3,
			}),
		}),
	})
end
