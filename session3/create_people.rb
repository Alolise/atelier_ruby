#!/usr/bin/env ruby

def ask_question item, clas
    print "Please give %s (%s): " % [item, clas]
    gets.chomp
end

# refactored extract method
def create_people resp, item, clas, pers
    if resp == ''
    elsif clas.is_a? Array and clas.include?(resp)
      pers.store(item, resp)
    elsif resp.is_a? clas 
      pers.store(item, resp)
    end
    pers
end

temp='something'
personnes=[]
# use bool
while temp != ""
  # extract method 
  # don't need declaration
  pers={}
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
    pers = create_people temp, item, clas, pers
  end
  personnes.push(pers) if pers != {}
end

puts personnes
