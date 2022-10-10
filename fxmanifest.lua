fx_version 'bodacious'
games { 'gta5' }

client_script  {
	'config.lua',
	"client.lua",


}

server_script  {
	'config.lua',
    "server.lua"

}

ui_page {
	'html/index.html',
}

files {
	'html/fonts/*.woff',
	'html/fonts/*.woff2',
	'html/fonts/*.ttf',
	'html/css/*.css',
	'html/js/*.js',
	'html/index.html',
	"html/fontawesome/webfonts/*.ttf",
	"html/fontawesome/css/*.css",
	'html/img/index.html',
    'html/img/*.png'
}


shared_script 'config.lua'
