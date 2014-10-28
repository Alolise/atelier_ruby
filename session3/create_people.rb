#!/usr/bin/env ruby

def ask_question item, clas
    print "Please give %s (%s): " % [item, clas]
    gets.chomp
end

def build_person resp, item, clas, person
  person.store(item, resp)
  person
end

def create_person definition
  person={}
  definition.each do |item,clas|
    temp = ask_question item,clas
    person = build_person temp, item, clas, person
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
