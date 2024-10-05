fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

author 'sobing'

description 'exter-library ui like nopixel 4.0'

version '1.0'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/*.js',
  'html/*.css',
  'html/*.png',
  'html/*.JPG',
  'html/*.svg',
  'html/sounds/*.ogg',
  'html/*.woff',
  'html/*.otf',
  'html/weaponimages/*.png'
}

client_scripts {
    'client.lua'
}

exports {
  'Progress',
}