#!/usr/bin/env ruby
hellos = {
        :fr => 'Bonjour le monde',
        :en => 'Hello world !',
        :de => 'Hallo Welt !',
        :it => 'Ciao mondo !',
        :es => 'Hola mundo !',
        :np => 'Salut les gars',
        :default => 'Dommage !',
}

##
# Fonction traduction
# Translate function
#
def translate2(language,pack)
	language = language.to_sym
	if pack.key? language
        	puts pack[language]	
	else
        	puts pack[:default]
	end
end

##
# Fonction traduction
# Translate function
#
def translate(language,pack)
	language = language.to_sym
	if language
		return pack[language]	
	else
   	return pack[:default]
	end
end

puts translate(ARGV[0],hellos)
puts translate2(ARGV[0],hellos)
# vim: ai:set ts=2:
