fx_version "cerulean"

game "gta5"

lua54 'yes'

author "Westman Resourcez"

shared_scripts {
  "configuration/config.lua",
  "@es_extended/imports.lua",
  "configuration/locales.lua",
  "configuration/gangs.lua"
}


client_scripts {
  "client/main.lua",
  "client/functions.lua"
}

server_script "server/main.lua"


dependency "esx_menu_default"