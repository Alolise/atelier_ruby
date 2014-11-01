puts "hello"+" world"
print "hello"+" "+"world"+"\n"
var="hello world"
print "%s %s\n" % [var, var]
age = 1000
multiple = 10
puts "je suis un viel ordinateur de #{age*multiple} ans"

def hello(string)
        print "hello %s\n" % string
end

hello("world")
hello("you")
hello("miss")
hello("sunshine")

tab = [ 5, 4, 3, 2, 1, "Go!" ]
for item in tab
        print "%s \n" % item
end

firstnames = [ "Rachida", "Hacina", "Sandrine", "Dalila", "Leila" ]

firstnames.each do |name|
  print "%s\n" % name
  puts "Je n'm que toua #{name}"
end

names={
        "Rachida" => "Avond",
        "Hacina" => "Mazouni",
        "Sandrine" => "Mazouni",
        "Dalila" => "Zeddoun",
        "Leila" => "Mazouni",
}
names.each {|x,y| print "%s %s\n" % [x,y]}

