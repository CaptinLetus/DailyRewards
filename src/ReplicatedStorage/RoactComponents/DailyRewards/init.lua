local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)
local Day = require(script.Day)
local CloseButton = require(script.CloseButton)
local ClaimButton = require(script.ClaimButton)

local DAY_IN_SECONDS = 86400

local DailyRewards = Roact.Component:extend("DailyRewards")

-- format time as hh:mm:ss
local function formatTime(time)
	local hours = math.floor(time / 3600)
	local minutes = math.floor((time - hours * 3600) / 60)
	local seconds = time - hours * 3600 - minutes * 60

	return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

local function getTimeLeft(lastReward)
	return lastReward - os.time() + DAY_IN_SECONDS
end

local function nextReward(props)
	local timeText = formatTime(props.Time)

	return Roact.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.5, 0.8),
		Size = UDim2.fromScale(0.275, 0.15),
		Visible = props.Visible,
	}, {
		title = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = "Next Reward In",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromScale(1, 0.4),
		}),
		timeLeft = Roact.createElement("TextLabel", {
			Font = Enum.Font.GothamBlack,
			Text = timeText,
			TextColor3 = Color3.fromRGB(255, 184, 248),
			TextScaled = true,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.4),
			Size = UDim2.fromScale(1, 0.6),
		}),
	})
end

function DailyRewards:init()
	self:setState({
		timeUntilNextReward = getTimeLeft(self.props.LastReward),
	})
end

function DailyRewards:didMount()
	self._active = true

	task.spawn(function()
		while self._active do
			self:setState({
				timeUntilNextReward = getTimeLeft(self.props.LastReward),
			})

			task.wait(1)
		end
	end)
end

function DailyRewards:willUnmount()
	self._active = false
end

function DailyRewards:render()
	local days = {}

	for i = 1, 7 do
		days[i] = Roact.createElement(Day, {
			Day = i,
			CurrentDay = self.props.CurrentDay,
			AlreadyClaimed = getTimeLeft(self.props.LastReward) > 0
		})
	end

	local timeLeft = self.state.timeUntilNextReward

	return Roact.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(248, 248, 248),
		Position = UDim2.fromScale(0.5, 0.475),
		Size = UDim2.fromScale(0.5, 0.5),
		Visible = self.props.Visible and self.props.Visible:map(function (value)
			return value
		end) or true
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
			Size = UDim2.fromScale(0.9, 0.6),
		}, {
			Roact.createFragment(days),
		}),
		nextReward = Roact.createElement(nextReward, {
			Time = timeLeft,
			Visible = timeLeft > 0,
		}),
		claim = Roact.createElement(ClaimButton, {
			Visible = timeLeft <= 0,
			OnClaim = self.props.OnClaim,
		}),
		close = Roact.createElement(CloseButton, {
			OnClose = self.props.OnClose,
		}),
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

return DailyRewards
