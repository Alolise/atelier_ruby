#!/usr/bin/env ruby

def ask_question item, clas
    print "Please give %s (%s): " % [item, clas]
    gets.chomp
end

def build_personne resp, item, clas, personne
  personne.store(item, resp)
  personne
end

def create_personne definition
  personne={}
  definition.each do |item,clas|
    temp = ask_question item,clas
    personne = build_personne temp, item, clas, personne
  end
  personne
end

temp='something'
personnes=[]
definition = {
               'name' => String,
               'age' => Integer,
               'sexe' => ['M','F'],
             }

# use bool
a=3
while a>0
  a-=1
  personne = create_personne definition
  personnes.push(personne) if personne != {}
end

puts personnes
