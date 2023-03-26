# println is a message that is sent to string "Hello, World!"
"Hello, World!" println

# object is a collection of slots
Vehicle := Object clone 

# new slot
Vehicle description := "Something to take you places"
Vehicle description 

# all slots
Vehicle slotNames // list(description, type)

Vehicle type // Vehicle

# prototype inheritance
Car := Vehicle clone
Car description 
Car type // Car

# ferrari is not a type it's an instance
# but both Car and ferrari are just objects with this one difference
ferrari := Car clone
ferrari type // Car

# lists
vegetables := list("apple", "banana", "orange")
nums := list(1, 2, 3, 4)
nums average 
nums sum 
nums at(1) 
nums append(5) 
nums pop 
list() isEmpty 

# map
elvis := Map clone
elvis atPut("home", "Graceland") 
elvis atPut("name", "elvis") 
elvis at("home") 
elvis asObject 
elvis asList 
elvis keys
elvis size 

# conditional statements
4 < 5	
true and true
true or false
0 and true 

# only nil and false are falsy values

# they are singletons
true proto 
nil 

# singleton
Highlander := Object clone
Highlander clone := Highlander

mike := Highlander clone
andrey := Highlander clone

mike == andrey // true