local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)
local DailyRewards = require(ReplicatedStorage.RoactComponents.DailyRewards)

local DailyRewardsRemotes = ReplicatedStorage:WaitForChild("DailyRewardsRemotes")
local ClaimReward = DailyRewardsRemotes:WaitForChild("ClaimReward")
local AwardInfoUpdated = DailyRewardsRemotes:WaitForChild("AwardInfoUpdated")
local GetRewardData = DailyRewardsRemotes:WaitForChild("GetRewardData")

local uiVisible, updateUIVisible = Roact.createBinding(true)
local handle

local function dailyRewardsUI(props)
	return Roact.createElement("ScreenGui", {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Global
	}, {
		DailyRewards = Roact.createElement(DailyRewards, {
			Visible = uiVisible,
			LastReward = props.LastReward,
			CurrentDay = props.CurrentDay,
			OnClose = function ()
				updateUIVisible(false)
			end,
			OnClaim = function ()
				ClaimReward:FireServer()
			end,
		})
	})
end

local function updateUI(dailyData)
	Roact.update(handle, dailyRewardsUI({
		LastReward = dailyData.lastReward,
		CurrentDay = dailyData.currentDay,
	}))
end

local dailyData = GetRewardData:InvokeServer()

handle = Roact.mount(dailyRewardsUI({
	LastReward = dailyData.lastReward,
	CurrentDay = dailyData.currentDay,
}), Players.LocalPlayer.PlayerGui, "DailyRewards")

AwardInfoUpdated.OnClientEvent:Connect(updateUI)
