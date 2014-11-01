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
#	if pack.key? language
#        	puts pack[language]	
#	else
#        	puts pack['default']
#	end
#end

##
# Fonction traduction
# Translate function
#
def translate(language,pack)
	if  language
		return pack[language]	
	else
   	return pack['default']
	end
end

puts translate(ARGV[0],hellos)
# vim: ai:set ts=2:
