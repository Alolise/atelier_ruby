#!/usr/bin/env ruby

def ask_question item, clas
    print "Please give %s (%s): " % [item, clas]
    gets.chomp
end

def create_person definition
  person={}
  definition.each do |item,clas|
    resp = ask_question item,clas
    person.store(item, resp)
  end
  person
end

temp='something'
people=[]
definition = {
               'name' => String,
               'age' => Integer,
               'sexe' => ['M','F'],
             }

# use bool
a=3
while a>0
  a-=1
  person = create_person definition
  people.push(person) if person != {}
end

puts people
