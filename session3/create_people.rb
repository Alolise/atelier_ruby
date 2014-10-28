#!/usr/bin/env ruby

def ask_question item, clas
    print "Please give %s (%s): " % [item, clas]
    gets.chomp
end

def create_people resp, item, clas, personne
  personne.store(item, resp)
  personne
end

temp='something'
personnes=[]
# use bool
while temp != ""
  # extract method 
  # don't need declaration
  personne={}
  # dont use class for a word
  # the reader is lost
  {
    'name' => String,
    'age' => Integer,
    'sexe' => ['M','F'],
  }.each do |item,clas|
    # rename res
    temp = ask_question item,clas
    # rename method we're on building someone
    personne = create_people temp, item, clas, personne
  end
  personnes.push(personne) if personne != {}
end

puts personnes
