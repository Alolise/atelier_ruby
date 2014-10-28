#!/usr/bin/env ruby

def ask_question item, clas
    print "Please give %s (%s): " % [item, clas]
    gets.chomp
end

def create_person definition
  person = {}
  resp = ""
  definition.each do |item,clas|
    resp = ask_question item,clas
    person.store(item, resp)
  end
  return person, resp
end

def create_people definition
  people = []
  response = "temp"
  # use bool
  until response.empty?
    person, response = create_person definition
    people.push(person) if person != {}
  end
  people
end

definition = {
               'name' => String,
               'age' => Integer,
               'sexe' => ['M','F'],
             }

puts create_people definition
