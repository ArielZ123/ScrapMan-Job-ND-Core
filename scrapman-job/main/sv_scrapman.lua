RegisterServerEvent('scrapjob:scrap:find')
AddEventHandler('scrapjob:scrap:find', function()
   local _source = source
   local player = NDCore.getPlayer(_source)
   if exports.ox_inventory:CanCarryItem(source, 'scrap', 1) then
      exports.ox_inventory:AddItem(_source, 'scrap', 1)
      TriggerClientEvent('ox_lib:notify', _source, {
         title = 'Scrapman Job',
         description = 'you found some scrap type, go ahead to sell this scrap to the dealer nearby',
         duration = 8000,
         position = 'center-left',
         type = 'success',
         icon = 'fa-solid fa-gears',
         iconColor = '#eb9b10'
      })
   else
      TriggerClientEvent('scrapman:job:stop', _source, jobstop)
      TriggerClientEvent('ox_lib:notify', _source, {
         title = 'Scrapman Job',
         description = 'there is no enough space in your inventory to collect scraps...',
         duration = 7000,
         position = 'center-left',
         type = 'warning',
         icon = 'fa-solid fa-exclamation',
         iconColor = '#f70202'
      })
   end
end)

RegisterServerEvent('scrapjob:scrap:sell')
AddEventHandler('scrapjob:scrap:sell', function()
   local _source = source
   local player = NDCore.getPlayer(_source)
   local scrapQuantity = exports.ox_inventory:GetItemCount(_source, 'scrap', nil, false)
   local addmoney = math.random(20, 50) -- change here the price of the scrap sell
   if scrapQuantity >= 1 then
       exports.ox_inventory:RemoveItem(_source, 'scrap', 1)
       player.addMoney("cash", addmoney, "scrap salary")
       TriggerClientEvent('ox_lib:notify', source, {
          title = 'Scrapman Job',
          description = 'you sold a scrap type for '  .. addmoney .. ' keep working!',
          duration = 8000,
          position = 'center-left',
          type = 'success',
          icon = 'fa-solid fa-wallet',
          iconColor = '#9dde1b'
       })
   elseif scrapQuantity then
      TriggerClientEvent('ox_lib:notify', _source, {
         title = 'Scrapman Job',
         description = 'you dont have any scrap type',
         duration = 8000,
         position = 'center-left',
         type = 'error',
         icon = 'fa-solid fa-gears',
         iconColor = '#eb9b10'
      })
   end
end)
