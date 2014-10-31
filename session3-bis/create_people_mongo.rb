#!/usr/bin/env ruby

require 'mongo'
require 'yaml'
require 'pp'
include Mongo

settings = YAML::load_file ARGV[0]
dbconf = settings['database']
host = dbconf['host'] || 'localhost'
port = dbconf['port'] || MongoClient::DEFAULT_PORT
client = MongoClient.new(host, port)
db = client.db(dbconf['base'])
coll = db.create_collection(dbconf['coll'])


client = MongoClient.new(host, port)
db = client.db('create_people')
db.authenticate
coll = db.create_collection('people')

# Ask the user questions about person (Name, age, etc...)
# Validate answer by checking validation rules
# Return the validated answer or void
def ask_question item, clas, validation
  valid = false
  while valid == false
    print "Please give %s (%s): " % [item, clas]
    response = gets.chomp
    valid = true if validation[item].match(response) or response.empty?
  end
  return response
end

# Create the Hash person
# Return false when one entry is void
# Return the hash person otherwise
def create_person definition, validation
  person = {}
  definition.each do |item,clas|
    resp = ask_question item, clas, validation
    return false if resp.empty?
    person.store(item, resp)
  end
  return person
end

# Create an array of persons called people
# Return the array people
def create_people definition, validation, coll
  people = []
  person = {}

  while person
    person = create_person definition, validation
    coll.insert(person) if person != false
    people.push(person) if person != false
  end
  people
end

# Hash of definition
# Key = type of information
# Value = class of information
definition = {
               name: String,
               age: Integer,
               sexe: ['M','F'],
             }

# Hash of validation
# Key = type of information
# Value = regex validating the information
validation = {
                name: /[a-zA-Z\-\s]+/,
                age: /\d+/,
                sexe: /M|F/,
             }

fields = {
                _id: 0,
             }
# Main
puts coll.find({},{fields: fields}).to_a
#puts coll.find({"name" => "Rachida"},{ "_id": 0} ).to_a
puts create_people definition, validation, coll
