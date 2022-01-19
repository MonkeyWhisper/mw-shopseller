local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(200)
        PlayerJob = QBCore.Functions.GetPlayerData().job
        isLoggedIn = true
    end
end)

exports['qb-target']:AddBoxZone("pawnshopseller", vector3(158.44, -1313.71, 29.36), 1, 1, {
		name="pawnshopseller",
		heading=0.0,
		debugPoly=false,
		minZ = 26.36,
		maxZ = 30.36,
	  },{
		options = {
				{
				  type = "server",
				  event = "mw-shopseller:server:sellItems",
				  icon = "fas fa-tablets",
				  label = "Sell Contraband",
				  job = "pawnshop", -- Remove this line if you do not want a job check.
				},
			 },
		distance = 1.5
})
