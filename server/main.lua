local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("mw-shopseller:server:sellItems")
AddEventHandler("mw-shopseller:server:sellItems", function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local price = 0
    if Player.PlayerData.items ~= nil and Player.PlayerData.job.name == "pawnshop" then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "rolex" then 
                    price = price + (Config.Items["rolex"]["price"] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("rolex", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "goldbar" then 
					price = price + (Config.Items["goldbar"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("goldbar", Player.PlayerData.items[k].amount, k)
				end
            end
        end
        Player.Functions.AddMoney("cash", price)
        TriggerEvent("qb-bossmenu:server:addAccountMoney", 'pawnshop', price*0.30)
		TriggerClientEvent('QBCore:Notify', src, "Sold, check your cash!")
	else 
		TriggerClientEvent('QBCore:Notify', src, "You are not a pawnshop employee!")
	end
end)


-- Uncomment Below if you do not want a job check

--[[ RegisterServerEvent("mw-shopseller:server:sellItems")
AddEventHandler("mw-shopseller:server:sellItems", function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local price = 0
    if Player.PlayerData.items ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "rolex" then 
                    price = price + (Config.Items["rolex"]["price"] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("rolex", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "goldbar" then 
					price = price + (Config.Items["goldbar"]["price"] * Player.PlayerData.items[k].amount)
					Player.Functions.RemoveItem("goldbar", Player.PlayerData.items[k].amount, k)
				end
            end
        end
        Player.Functions.AddMoney("cash", price)
		TriggerClientEvent('QBCore:Notify', src, "Sold, check your cash!")
	end
end) ]]