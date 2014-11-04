#!/usr/bin/env ruby

require 'mongo'
require 'yaml'
require 'pp'
include Mongo

def usage
  return "
  usage: #{$PROGRAM_NAME} ConfigFile

    Creation of people, the configfile configure the mongo connection
  "
end

def connect_mongo dbconf
  base, collection, host, password, port, user = Hash[dbconf.sort].values
  #printf "%s %s %s %s %s \n" % Hash[dbconf.sort].values
  #MongoClient::DEFAULT_PORT
  client = MongoClient.new( host, port )
  db = client.db( base )
  db.authenticate( user, password )
  #coll = db.create_collection( collection ) if db[ collection ]
  coll = db.collection( collection )
  return client, db, coll
end


# Ask the user questions about person (Name, age, etc...)
# Validate answer by checking validation rules
# Return the validated answer or void
def ask_question item, clas, definition
  valid = false
  while valid == false
    print "Please give %s (%s): " % [item, clas]
    response = gets.chomp
    valid = true if definition[item][1].match(response) or response.empty?
  end
  return response
end

# Create the Hash person
# Return false when one entry is void
# Return the hash person otherwise
def create_person definition
  person = {}
  definition.each do |item,array|
    resp = ask_question item, array[0], definition
    return false if resp.empty?
    person.store(item, resp)
  end
  return person
end

# Create an array of persons called people
# Return the array people
def create_people definition, coll
  people = []
  person = {}

  while person
    person = create_person definition
    coll.insert(person) if person != false
    people.push(person) if person != false
  end
  people
end

def find_someone definition
  person = {}
  definition.each do |item,array|
    resp = ask_question item, array[0], definition
    next if resp.empty?
    person.store(item, resp)
  end
  return person
end

def find_people definition, coll, fields
  person = {}
  more = true
  while more
    person = find_someone definition
    puts coll.find( person, {fields: fields} ).to_a
    puts "More ? y/n "
    more = false if gets.chomp == "n"
  end
end

# Hash of table of definition and validation
# Key = type of information
# Value = class of information
# Value = regex validating the information
definition = {
               name: [ String, /[a-zA-Z\-\s]+/ ],
               age: [ Integer, /\d+/ ],
               sexe: [ ['M','F'], /M|F/ ],
             }

fields = {
                _id: 0,
             }
# Main
file = ARGV[0] or abort usage
settings = YAML::load_file( file )
ARGV.clear

client, db, coll = connect_mongo settings['database']
puts create_people definition, coll
puts coll.find({},{fields: fields}).to_a
puts find_people definition, coll, fields
