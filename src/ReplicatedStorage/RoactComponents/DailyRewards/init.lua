local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)
local Day = require(script.Day)
local Day7 = require(script.Day7)
local CloseButton = require(script.CloseButton)
local ClaimButton = require(script.ClaimButton)

local e = Roact.createElement

local function nextReward()
	return Roact.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.5, 0.8),
		Size = UDim2.fromScale(0.275, 0.15),
	}, {
		price = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = "Next Reward In",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 14,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromScale(1, 0.4),
		}),
		timeLeft = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = "23:59:25",
			TextColor3 = Color3.fromRGB(255, 184, 248),
			TextScaled = true,
			TextSize = 14,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.4),
			Size = UDim2.fromScale(1, 0.6),
		}),
	})
end

return function(props)
	local days = {}

	for i = 1, 6 do
		days[i] = Roact.createElement(Day)
	end

	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(248, 248, 248),
		Position = UDim2.fromScale(0.5, 0.475),
		Size = UDim2.fromScale(0.5, 0.5),
	}, {
		uIStroke = Roact.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(0, 122, 144),
			Thickness = 5,
		}),
		uICorner = Roact.createElement("UICorner", {
			CornerRadius = UDim.new(0, 20),
		}),
		uIGradient = Roact.createElement("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(98, 220, 232)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 141, 170)),
			}),
			Rotation = 90,
		}),
		mainDays = Roact.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.15),
			Size = UDim2.fromScale(0.9, 0.3),
		}, {
			uIListLayout = Roact.createElement("UIListLayout", {
				Padding = UDim.new(0.00800000038, 0),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
			}),
			Roact.createFragment(days),
		}),
		day7 = Roact.createElement(Day7),
		nextReward = Roact.createElement(nextReward),
		claim = Roact.createElement(ClaimButton),
		close = Roact.createElement(CloseButton),
		title = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = "DAILY REWARDS",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 14,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0, 0.01),
			Rotation = -2,
			Size = UDim2.fromScale(0.8, 0.15),
		}, {
			uIStroke = Roact.createElement("UIStroke", {
				Color = Color3.fromRGB(0, 122, 144),
				Thickness = 8,
			}),
		}),
	})
end
