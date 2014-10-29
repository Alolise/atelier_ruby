Version with mongodb
====================

###Install Mongo
Debian : 
> aptitude install mongodb-server

Centos :
> yum install mongodb

###Check Mongo

> $ ruby create\_people\_mongo.rb

> Please give name (String): 

> ...

> $ mongo

> \> use create\_people

> \> db.people.find()

> { "\_id" : ObjectId("5554484154c7b1a0d000001"), "name" : "John Doe", "age" : "23", "sexe" : "M" }

> ...
