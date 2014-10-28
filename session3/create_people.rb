#!/usr/bin/env ruby

def ask_question item, clas, validation
  valid = false
  while valid == false
    print "Please give %s (%s): " % [item, clas]
    response = gets.chomp
    valid = true if validation[item.to_sym].match(response) or response.empty?
  end
  return response
end

def create_person definition, validation
  person = {}
  resp = ""
  definition.each do |item,clas|
    resp = ask_question item, clas, validation
    return false if resp.empty?
    person.store(item, resp)
  end
  return person
end

def create_people definition, validation
  people = []
  response = "temp"
  person = {}
  # use bool
  while person
    person = create_person definition, validation
    people.push(person) if person != false
  end
  people
end

definition = {
               'name' => String,
               'age' => Integer,
               'sexe' => ['M','F'],
             }
validation = {
                name: /[a-zA-Z\-\s]+/,
                age: /\d+/,
                sexe: /M|F/,
             }

puts create_people definition, validation
