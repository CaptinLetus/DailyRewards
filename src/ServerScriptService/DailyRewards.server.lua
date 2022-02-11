local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local Datastore2 = require(ServerScriptService.DataStore2)
local Rewards = require(ReplicatedStorage.Rewards)

local DAILY_DS = "daily_01"
local DEFAULT_DATA = {
	lastReward = 0,
	currentDay = 1
}
local DAY_IN_SECONDS = 86400

local DailyRewardsRemotes = ReplicatedStorage:WaitForChild("DailyRewardsRemotes")
local ClaimReward = DailyRewardsRemotes:WaitForChild("ClaimReward")
local AwardInfoUpdated = DailyRewardsRemotes:WaitForChild("AwardInfoUpdated")
local GetRewardData = DailyRewardsRemotes:WaitForChild("GetRewardData")

local function getAwardInfo(player)
	local dailyStore = Datastore2(DAILY_DS, player)

	return dailyStore:Get(DEFAULT_DATA), dailyStore
end

--[[
	You will want to add your own award logic here.
]]--
local function giveReward(player, day)
	local rewardInfo = Rewards[day]

	if rewardInfo.type == "coins" then
		print("give", player, rewardInfo.amount, "coins")
	elseif rewardInfo.type == "random" then
		print("give", player, "a random reward")
	end
end

ClaimReward.OnServerEvent:Connect(function (player)
	local dailyData, dailyStore = getAwardInfo(player)

	-- make sure the player hasn't already claimed their reward for today
	local lastReward = dailyData.lastReward
	local timeLeft = lastReward - os.time() + DAY_IN_SECONDS

	if timeLeft > 0 then
		return
	end

	-- award the player their reward
	giveReward(player, dailyData.currentDay)

	-- update datastore
	local currentDay = dailyData.currentDay
	if currentDay >= 7 then
		currentDay = 1
	else
		currentDay += 1
	end

	local rewardData = {
		lastReward = os.time(),
		currentDay = currentDay
	}

	dailyStore:Set(rewardData)
	AwardInfoUpdated:FireClient(player, rewardData)
end)

GetRewardData.OnServerInvoke = function (player)
	local data = getAwardInfo(player)

	 return data
end

-- make sure a player is still allows to claim todays reward
while task.wait(1) do
	for _,player in pairs (Players:GetPlayers()) do
		local rewardData, rewardStore = getAwardInfo(player)

		local timeLeft = rewardData.lastReward - os.time() + (DAY_IN_SECONDS * 2)

		if timeLeft <= 0 then
			rewardData.currentDay = 1
			rewardStore:Set(rewardData)
			AwardInfoUpdated:FireClient(player, rewardData)
		end
	end
end