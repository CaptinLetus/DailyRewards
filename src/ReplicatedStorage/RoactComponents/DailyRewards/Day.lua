local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)
local RewardData = require(ReplicatedStorage.Rewards)

local COLORS = {
	normal = {
		background = Color3.fromRGB(224, 248, 255),
		text = Color3.fromRGB(46, 118, 172),
		highlight = Color3.fromRGB(182, 232, 246),
	},
	today = {
		background = Color3.fromRGB(228, 111, 222),
		text = Color3.fromRGB(117, 49, 114),
		highlight = Color3.fromRGB(255, 148, 250),
	},
	claimed = {
		background = Color3.fromRGB(119, 132, 136),
		text = Color3.fromRGB(22, 56, 82),
		highlight = Color3.fromRGB(128, 158, 167),
	},
}

local function day7(props)
	return Roact.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 1),
		BackgroundColor3 = props.BackgroundColor3,
		Position = UDim2.fromScale(0.5, 1),
		Size = UDim2.fromScale(1, 0.5),
	}, {
		uICorner = Roact.createElement("UICorner", {
			CornerRadius = UDim.new(0.200000003, 0),
		}),
		dayTitle = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = props.Text,
			TextColor3 = props.TextColor3,
			TextScaled = true,
			TextSize = 14,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.15, 0.15),
			Size = UDim2.fromScale(0.2, 0.3),
		}),
		giftText = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = "Surprise Gift!",
			TextColor3 = props.TextColor3,
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
			TextColor3 = props.TextColor3,
			TextScaled = true,
			TextSize = 14,
			TextWrapped = true,
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.975, 0.5),
			Size = UDim2.fromScale(0.3, 0.5),
		}),
		imageLabel = Roact.createElement("ImageLabel", {
			Image = props.Image,
			ScaleType = Enum.ScaleType.Fit,
			AnchorPoint = Vector2.new(0.5, 1),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.975),
			Size = UDim2.fromScale(1, 1),
		}),
	})
end

local function normalDay(props)
	local size = 0.16
	local padding = 0.008
	local dayMinus1 = props.Day - 1

	return Roact.createElement("Frame", {
		BackgroundColor3 = props.BackgroundColor3,
		Size = UDim2.fromScale(size, 0.48),
		Position = UDim2.fromScale(padding * dayMinus1 + size * dayMinus1, 0),
	}, {
		uICorner = Roact.createElement("UICorner", {
			CornerRadius = UDim.new(0.2, 0),
		}),
		frame = Roact.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 1),
			BackgroundColor3 = props.HighlightColor3,
			Position = UDim2.fromScale(0.5, 0.95),
			Size = UDim2.fromScale(0.9, 0.6),
		}, {
			uICorner1 = Roact.createElement("UICorner", {
				CornerRadius = UDim.new(0.2, 0),
			}),
			imageLabel = Roact.createElement("ImageLabel", {
				Image = props.Image,
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
			Text = props.Text,
			TextColor3 = props.TextColor3,
			TextScaled = true,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.05),
			Size = UDim2.fromScale(0.7, 0.25),
		}),
	})
end

return function(props)
	local image = "rbxassetid://" .. RewardData[props.Day].image
	local currentDay = props.CurrentDay

	local isTodayCurrent = props.Day == currentDay
	local alreadyClaimed = props.AlreadyClaimed

	local text = "Day " .. props.Day
	local colorPallet = COLORS.normal

	if props.Day < props.CurrentDay then
		text = "Claimed"
		colorPallet = COLORS.claimed
	end

	if isTodayCurrent then
		if not alreadyClaimed then
			text = "Today"
			colorPallet = COLORS.today
		else
			text = "Tomorrow"
			colorPallet = COLORS.today
		end
	end

	local backgroundColor3 = colorPallet.background
	local textColor3 = colorPallet.text
	local highlightColor3 = colorPallet.highlight

	local dayProps = {
		Day = props.Day,
		CurrentDay = props.CurrentDay,
		AlreadyClaimed = props.AlreadyClaimed,
		Image = image,
		Text = text,
		TextColor3 = textColor3,
		HighlightColor3 = highlightColor3,
		BackgroundColor3 = backgroundColor3,
	}

	if props.Day == 7 then
		return Roact.createElement(day7, dayProps)
	else
		return Roact.createElement(normalDay, dayProps)
	end
end
