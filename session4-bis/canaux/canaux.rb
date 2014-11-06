#!/usr/bin/env ruby

require 'mongo'
require 'yaml'
require 'pp'
include Mongo

def usage
  return "
  usage: #{$PROGRAM_NAME} ConfigFile

    Creation/listing of publishing channels, 
    The default configfile is ~/.canaux
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


# Ask the user questions about channel (type, URL, login, pass etc...)
# Validate answer by checking validation rules
# Return the validated answer or void
def ask_question item, param
  valid = false
  while valid == false
    print "Please give %s (%s - %s): " % [item, param['type'], param['desc']]
    response = gets.chomp
    validation = eval param['validation']
    valid = true if validation.match(response) or response.empty?
  end
  return response
end

# Create the Hash channel
# Return false when one entry is void
# Return the hash channel otherwise
def create_channel definition
  channel = {}
  definition.each do |item,param|
    resp = ask_question item, param
    return false if resp.empty?
    channel.store(item, resp)
  end
  return channel
end

# Create an array of channels called channels
# Return the array channels
def create_channels definition, coll
  channels = []
  channel = {}

  while channel
    channel = create_channel definition
    coll.insert(channel) if channel != false
    channels.push(channel) if channel != false
  end
  channels
end

def find_somechannel definition
  channel = {}
  definition.each do |item,param|
    resp = ask_question item, param
    next if resp.empty?
    channel.store(item, resp)
  end
  return channel
end

def find_channels definition, coll, fields
  channel = {}
  more = true
  while more
    channel = find_somechannel definition
    puts coll.find( channel, {fields: fields} ).to_a
    puts "More ? y/n "
    more = false if gets.chomp == "n"
  end
end

# next in configfile
fields = { _id: 0, }


# Main
file = ARGV[0] or abort usage
settings = YAML::load_file( file )
ARGV.clear

client, db, coll = connect_mongo settings['database']

definition_f = settings['definition']

puts create_channels definition_f, coll
puts coll.find({},{fields: fields}).to_a
puts find_channels definition_f, coll, fields
