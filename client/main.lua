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

-- Optional spawn ped creator if you don't want to use ms-peds or qb-target ped spawning. 
--[[ Citizen.CreateThread(function()
	spawnPed1()
end)

local ped1 = nil
local hasbeenrobbed = false

-- Pawnshop Ped
function spawnPed1()
if ped1 == nil and not hasbeenrobbed then
  RequestModel(GetHashKey('g_m_m_mexboss_01'))
  while not HasModelLoaded(GetHashKey('g_m_m_mexboss_01')) do
  Wait(1)
  end
  ped1 = CreatePed(2, GetHashKey('g_m_m_mexboss_01'), 106.40, -1281.03, 28.80, 9.94, false, false) -- change here the cords for the ped 
  SetPedFleeAttributes(ped1, 0, 0)
  SetPedDiesWhenInjured(ped1, false)
  TaskStartScenarioInPlace(ped1, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
  SetPedKeepTask(ped1, true)
  SetBlockingOfNonTemporaryEvents(ped1, true)
  SetEntityInvincible(ped1, true)
  end
end ]]
