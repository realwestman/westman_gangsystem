Config = {

  -- Your core name should be added here.
  Engine = "es_extended", 
  
  -- Are you using ox_inventory? Else put "false"
  OxInventory = true, 

  -- Do you want the gang members to card "bank" or cash "money" when purchasing from armory?
  MoneyType = "bank", 

  -- Your bossmenu export should be added here.
  BossMenuExport = function()
      print("No export added")
   end,

   -- This is the event if you're using esx_skin, else you'll need to change it to your skin script.
   WardrobeEvent = function()
    TriggerEvent("esx_skin:openSaveableMenu")
   end
}

