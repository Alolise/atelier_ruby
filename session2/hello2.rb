#!/usr/bin/env ruby
lang = ARGV[0]

hellos = {
	'fr' => 'Bonjour le monde',
	'en' => 'Hello world !',
	'de' => 'Hallo Welt !',
	'it' => 'Ciao mondo !',
	'es' => 'Hola mundo !',
	'np' => 'Salut les connards',
	'default' => 'Connard !',
}
#Solution 1
puts hellos[lang]
#Solution 2
if not lang
	puts hellos['default']
else
	puts hellos[lang]
end
