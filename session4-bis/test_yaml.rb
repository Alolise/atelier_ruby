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

#base, collection, host, password, port, user = Hash[dbconf.sort].values
# Main
file = ARGV[0] or abort usage
settings = YAML::load_file( file )
ARGV.clear

defs = settings['definition']

defs.each do |item,param|
  puts "#{item} :"
  param.each do |k,value|
    puts "  #{k}: #{value} #{value.class}"
  end
end
