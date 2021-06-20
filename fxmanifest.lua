fx_version 'cerulean'
game 'gta5'

description 'nbk_blips utilities for FXServer'

client_scripts{ 
"client.lua",
"example.lua"
}

exports {
	"GetBlips",
	"GetClosestBlip",
	"GetClosestBlipByCoords",
	"GetOnScreenBlips",
	"GetOnScreenClosestBlip",
	"GetOnScreenClosestBlipByCoords",
	"GetBlipsBySprite",
	"GetClosestBlipBySprite",
	"GetClosestBlipBySpriteByCoords",
	"GetOnScreenBlipsBySprite",
	"GetOnScreenClosestBlipBySprite",
	"GetOnScreenClosestBlipBySpriteByCoords",
    "RequestClosestBlipBySpriteUpdate",
    "RequestOnScreenClosestBlipBySpriteUpdate"
}
