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
    return false if resp.empty?
    person.store(item, resp)
  end
  return person
end

def create_people definition
  people = []
  response = "temp"
  person = {}
  # use bool
  while person
    person = create_person definition
    people.push(person) if person != false
  end
  people
end

definition = {
               'name' => String,
               'age' => Integer,
               'sexe' => ['M','F'],
             }

puts create_people definition
