local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)


return function (props)
	return Roact.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.fromRGB(224, 248, 255),
		Position = UDim2.fromScale(0.5, 0.475),
		Size = UDim2.fromScale(0.9, 0.3),
	  }, {
		uICorner = Roact.createElement("UICorner", {
		  CornerRadius = UDim.new(0.200000003, 0),
		}),
		dayTitle = Roact.createElement("TextLabel", {
		  Font = Enum.Font.GothamBlack,
		  Text = "Day 7",
		  TextColor3 = Color3.fromRGB(46, 118, 172),
		  TextScaled = true,
		  TextSize = 14,
		  TextWrapped = true,
		  AnchorPoint = Vector2.new(0.5, 0),
		  BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		  BackgroundTransparency = 1,
		  Position = UDim2.fromScale(0.15, 0.15),
		  Size = UDim2.fromScale(0.2, 0.3),
		}),
		giftText = Roact.createElement("TextLabel", {
		  Font = Enum.Font.GothamBlack,
		  Text = "Surprise Gift!",
		  TextColor3 = Color3.fromRGB(46, 118, 172),
		  TextScaled = true,
		  TextSize = 14,
		  TextWrapped = true,
		  AnchorPoint = Vector2.new(0.5, 0),
		  BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		  BackgroundTransparency = 1,
		  Position = UDim2.fromScale(0.15, 0.45),
		  Size = UDim2.fromScale(0.2, 0.15),
		}),
		infoText = Roact.createElement("TextLabel", {
		  Font = Enum.Font.GothamBlack,
		  Text = "Come back every day to collect your reward!",
		  TextColor3 = Color3.fromRGB(46, 118, 172),
		  TextScaled = true,
		  TextSize = 14,
		  TextWrapped = true,
		  AnchorPoint = Vector2.new(1, 0.5),
		  BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		  BackgroundTransparency = 1,
		  Position = UDim2.fromScale(0.975, 0.5),
		  Size = UDim2.fromScale(0.3, 0.5),
		}),
		imageLabel = Roact.createElement("ImageLabel", {
		  Image = "rbxassetid://7813002465",
		  ScaleType = Enum.ScaleType.Fit,
		  AnchorPoint = Vector2.new(0.5, 1),
		  BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		  BackgroundTransparency = 1,
		  Position = UDim2.fromScale(0.5, 0.975),
		  Size = UDim2.fromScale(1, 1),
		}),
	  })
end