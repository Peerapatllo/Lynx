getgenv().Level = 0
getgenv().HardMode = true

repeat task.wait() until game:IsLoaded()

local Players = game:WaitForChild("Players", 10)
local LocalPlayer = Players.LocalPlayer

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)

repeat task.wait() until PlayerGui:WaitForChild("Bar", 10).Enabled == true

repeat task.wait(0.5)
for i = 1, 2 do
task.delay(0, function()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("InfiniteCastleManager"):FireServer("GetData")
end)

task.delay(0.5, function()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("InfiniteCastleManager"):FireServer("GetGlobalData")
end)
end

for i = 1, 2 do
task.delay(1, function()
local args = {
    [1] = "Play",
    [2] = Level,
    [3] = HardMode
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("InfiniteCastleManager"):FireServer(unpack(args))
end)
end
until false == true
