function CarEmpty(car)
  local timer = 10 --minuti
  while true do
  Wait(timer * 60000) --converte
  for posto = -1, 6 do 
    if GetPedInVehicleSeat(car, posto) ~= 0 then 
      return true --occupato
    end
  end
  return false --non occupato
end

CreateThread(function()
  for i, cars in pairs(GetAllVehicles()) do 
    if HasVehicleBeenOwnedByPlayer(cars) then 
        if not CarEmpty(cars) then
            DeleteEntity(cars)
        end
    end
  end
end)
