Gangs = {

    ["angels"] = {
  
      Blip = {
        show = true, 
        coords = vec3(983.9044, -109.7639, 74.3038), 
        id = 40,
        color = 3,
        name = "Hells Angels" 
      },
    
      BossMenu = vec3(975.9081, -100.4858, 74.8701), 
      JobName = "angels", 
      
      Armory = vec3(973.1986, -97.2389, 74.8700), 
      ArmoryItems = {
        {label = "Glock 45 - 9700 kr", hash = "weapon_combatpistol", value = 1, type = "slider", min = 1, max = 5, cost = 9700},
        {label = "Colt M911 45 - 11000 kr", hash = "weapon_heavypistol", value = 1, type = "slider", min = 1, max = 5, cost = 11000},
        {label = "Kniv - 300 kr", hash = "weapon_knife", value = 1, type = "slider", min = 1, max = 5, cost = 300},
        {label = "9mm - 10 kr", hash = "ammo-9", value = 1, type = "slider", min = 1, max = 120, cost = 10}
      },
    
      Garage = vec3(963.9423, -117.2580, 74.3531),
      VehicleSpawn = vec3(966.9949, -121.3003, 74.3531),
      VehicleSpawnHeading = 212.4417,
      StoreVehicle = vec3(978.1683, -132.9728, 73.6964),
      Wardrobe = vec3(983.1353, -98.5907, 74.8456),
    
      GarageVehicles = {
        {label = "BMW", hash = "bmci"},
        {label = "Adder", hash = "adder"},
        {label = "Motorcyckel", hash = "sanctus"},
        {label = "Zentorno", hash = "zentorno"}
      },
    
      Stash = { 
        id = 'angels', 
        label = 'Stash - Hells Angels',
        slots = 20,
        weight = 30000,
        owner = false,
        coords = vec3(977.4749, -103.9701, 74.8450)
      },
    },
  
   ["ms13"] = {
  
      Blip = {
        show = true,
        coords = vec3(84.7081, -1955.6937, 20.7474),
        id = 40,
        color = 3,
        name = "MS13"
      },
    
      BossMenu = vec3(88.5749, -1959.9335, 20.7474),
      JobName = "ms13", 
    
      Armory = vec3(87.1482, -1963.2775, 20.7475),
      ArmoryItems = {
        {label = "Glock 45 - 9700 kr", hash = "weapon_combatpistol", value = 1, type = "slider", min = 1, max = 5, cost = 9700},
        {label = "Kniv - 300 kr", hash = "weapon_knife", value = 1, type = "slider", min = 1, max = 5, cost = 300},
        {label = "9mm - 12 kr", hash = "ammo-9", value = 1, type = "slider", min = 1, max = 120, cost = 10}
      },
    
      Garage = vec3(84.0184, -1973.6439, 20.9232),
      VehicleSpawn = vec3(87.7095, -1969.2103, 20.7474),
      VehicleSpawnHeading = 321.6656,
      StoreVehicle = vec3(102.3056, -1958.0961, 20.7412),
      Wardrobe = vec3(81.4099, -1970.0768, 20.8348),
      
      GarageVehicles = {
        {label = "BMW", hash = "bmci"},
        {label = "Adder", hash = "adder"},
        {label = "Zentorno", hash = "zentorno"}
      },
    
      Stash = { 
        id = 'ms13', 
        label = 'Stash - MS13',
        slots = 20,
        weight = 30000,
        owner = false,
        coords = vec3(84.0507, -1966.9712, 20.9391)
      },
    }
  }