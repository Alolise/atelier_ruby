#!/usr/bin/env ruby
hellos = {
        'fr' => 'Bonjour le monde',
        'en' => 'Hello world !',
        'de' => 'Hallo Welt !',
        'it' => 'Ciao mondo !',
        'es' => 'Hola mundo !',
        'np' => 'Salut les gars',
        'default' => 'Dommage !',
}

#def translate(language,pack)
#	if  language in pack.keys
#        	puts pack[language]	
#	else
#        	puts pack['default']
#	end
#end
def translate(language,pack)
	if  language
	²	puts pack[language]	
	else
        	puts pack['default']
	end
end

translate(ARGV[0],hellos)
# vim: ai:set ts=2:
