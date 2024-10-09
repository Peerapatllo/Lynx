local comma = function(arr)
	local v1 = arr
	while true do
		local v2, v3 = string.gsub(v1, "^(-?%d+)(%d%d%d)", "%1,%2")
		v1 = v2
		if v3 ~= 0 then else
			break
		end
	end
	return v1
end

local reward_list = function(gem_get, gold_get)
	local get_gold = " Gems <:gem_av:1282972514342928385>"
	local get_gem = " Gold <:gold_av:1293291288971706503>"
	return "<a:Dot:1147531692916088892>** " ..gem_get .."**".. get_gem .. "\n" .. "<a:Dot:1147531692916088892>** ".. gold_get .."**".. get_gold
end

local reward_item = function(items)
	local item_list = ""
	for itemName, itemData in pairs(items) do
		local amount = itemData["Amount"]
		item_list = item_list .. ("<a:Dot:1147531692916088892> + %d %s\n"):format(amount,itemName)
	end
	return item_list
end

local timer = function(seconds)
	local minutes = math.floor(seconds / 60)
	local remaining_seconds = seconds % 60
	return string.format("%d minutes %d seconds", minutes, remaining_seconds)
end

local send_webhookINDYX = function()

  local HttpService = game:GetService('HttpService')
  local thumbnails_avatar = HttpService:JSONDecode(game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. game:GetService("Players").LocalPlayer.UserId .. "&size=150x150&format=Png&isCircular=true", true))
  local Time = os.date('!*t', OSTime);

	local localplayer = game:GetService("Players").LocalPlayer
	local name_player = tostring(localplayer.Name.." ("..localplayer.DisplayName..")")
	local level_player = localplayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Main"):FindFirstChild("Level"):FindFirstChild("Level").Text
	level_player = string.gsub(level_player, "Level", "**Level: **")

	local gamedata = require(game:GetService("ReplicatedStorage").Modules.Gameplay.GameHandler)
	local act_name = require(game:GetService("ReplicatedStorage").Modules.Data.StagesData.Story[tostring(gamedata.GameData.Stage)]:FindFirstChild("Acts")[gamedata.GameData.Act])
	local act_data = tostring(act_name.ActName.." ("..gamedata.GameData.Stage.." "..gamedata.GameData.Act..")")

	local Timermap = localplayer.PlayerGui:FindFirstChild("EndScreen"):FindFirstChild("Container"):FindFirstChild("EndScreen"):FindFirstChild("Main"):FindFirstChild("StageStatistics"):FindFirstChild("PlayTime"):FindFirstChild("Amount").Text
	local Stagename = localplayer.PlayerGui:FindFirstChild("EndScreen"):FindFirstChild("Container"):FindFirstChild("EndScreen"):FindFirstChild("Main"):FindFirstChild("StageInfo"):FindFirstChild("Main"):FindFirstChild("StageName").Text
	local ActnameX = localplayer.PlayerGui:FindFirstChild("EndScreen"):FindFirstChild("Container"):FindFirstChild("EndScreen"):FindFirstChild("Main"):FindFirstChild("StageInfo"):FindFirstChild("Main"):FindFirstChild("ActName").Text
	local Wavemap = localplayer.PlayerGui:FindFirstChild("HUD"):FindFirstChild("Map"):FindFirstChild("WavesAmount").Text

	local Gemdrop = localplayer.PlayerGui:FindFirstChild("HUD"):FindFirstChild("Map"):FindFirstChild("StageRewards"):FindFirstChild("Gems"):FindFirstChild("Amount").Text
	local Golddrop = localplayer.PlayerGui:FindFirstChild("HUD"):FindFirstChild("Map"):FindFirstChild("StageRewards"):FindFirstChild("Coins"):FindFirstChild("Amount").Text
	Gemdrop = string.gsub(Gemdrop, "x", "+ ")
	Golddrop = string.gsub(Gemdrop, "x", "+ ")

	XFarm = "# <a:loading:1147559049160822874> <:f1:1135448982051639337><:f2:1135448984178135050><:f3:1135448989693653032><:f4:1135448994974285915><:f5:1135448997260181564> <a:loading:1147559049160822874>"
	Playerstats = ("<a:d4:1113801645931896912>**Name:** ||%s||<a:d5:1113801649014718545>\n<a:Dot:1147531692916088892>%s <a:mee6lvlup:1123179161054355527>\n<a:Dot:1147531692916088892>**Gems:** %s <:gem_av:1282972514342928385>\n<a:Dot:1147531692916088892>**Gold:** %s <:gold_av:1293291288971706503>"):format(name_player,level_player,comma(localplayer:GetAttribute("Gems")),comma(localplayer:GetAttribute("Gold")))
  	XGameStats = "# <a:stockup:1123197731876393010> <:g1:1135449004927369216><:g2:1135449008240857189><:g3:1135449010287673374><:g4:1135449013898977390> <a:stockup:1123197731876393010>"
  	Mapstats = "<a:Dot:1147531692916088892>**Map:** "..Stagename.. " ("..ActnameX..") - "..status_get.."\n<a:Dot:1147531692916088892>**Wave:** "..Wavemap.." - ( "..Timermap.." )"
  	XItem = "# <a:fight:1129761802100682862> <:i1:1135449015757045840><:i2:1135449019024408587><:i3:1135449022392442900><:i4:1135449024107909203> <a:fight:1129761802100682862>"
  	Itemstats = ("<a:Dot:1147531692916088892> "..Gemdrop.." <:gem_av:1282972514342928385>\n<a:Dot:1147531692916088892> "..Golddrop.." <:gold_av:1293291288971706503>\n%s"):format(reward_item(items))

	local data = {
    ["content"] ="",
    ["username"] = "INDYBUX BOT",
    ["avatar_url"] = "https://media.discordapp.net/attachments/1249339758099042364/1283053151800393779/INDYBUX.png?ex=670681dd&is=6705305d&hm=0f5a447abce06e748604677c573dd794f8d7f6fc2266f3d34d79f438dde4ca37&=&format=webp&quality=lossless",
		["embeds"] = {
			{
        ["thumbnail"] = {
          ['url'] = thumbnails_avatar.data[1].imageUrl,
        },
				["color"] = 10181046,
        ["description"] = ""
        ..XFarm.. "\n"
        ..Playerstats.. "\n"
        ..XGameStats.. "\n"
        ..Mapstats.. "\n"
        ..XItem.. "\n"
        ..Itemstats.. "\n",
        ["author"] = {
          ["name"] = "Anime Vanguards",
          ["icon_url"] = "https://img.pic.in.th/oie_27168246JMfoaRb.gif"
        },
        ["timestamp"] = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec),
        ["footer"] = {
          ["text"] = "INDYBUX Service",
          ["icon_url"] = "https://img.pic.in.th/oie_27168246JMfoaRb.gif"
        },
			}
		}
	}
	request({
		Url = shared.Configs["Webhook"],
		Method = 'POST',
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = game:GetService("HttpService"):JSONEncode(data)
	})
end

game:GetService("ReplicatedStorage").Networking.EndScreen.ShowEndScreenEvent.OnClientEvent:Connect(function(data,...)
	gold = (data.Status == "Finished") and data.Rewards["Currencies"]["Gold"]["Amount"] or "Failed."
	gem = (data.Status == "Finished") and data.Rewards["Currencies"]["Gems"]["Amount"] or "Failed."
	items = (data.Status == "Finished") and data.Rewards["Items"] or {["Item Drop"] = {["Amount"] = 0}}
	status_get = data.Status time_taken_get = data.TimeTaken
	send_webhookINDYX()
end)
