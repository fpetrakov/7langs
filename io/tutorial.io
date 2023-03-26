# Math
1 + 1
1 + 1 == 2
4 sqrt


# Variables
a := 1
b := 2 * 3


# Conditions
writeln("Conditions", "\n")

a := 2
(a == 1) ifTrue("a is one" println) ifFalse("a is not one" println)
if (a == 1, writeln("a is one"), writeln("a is not one"))


# Lists
writeln("\n", "Lists", "\n")

nums := List clone append(31, 10, 5, 20)
nums size
nums println
nums := nums sort // 5 10 20 31
nums first println
nums at(2) println
nums remove(31)
nums atPut(1, 123) println // 5 123 20

list(30, 10, 5, 20) detect(> 10) println // 30
list(30, 20, 10) select(> 10) println // 30, 20
list(10, 2) map(num, num * num) println


# Loops
writeln("\n", "Loops", "\n")

for(i, 1, 10, write(i, "***"))
nums foreach(index, num, writeln(index, ": ", num))
list("abc", "def", "ghi") foreach(println)


# Dictionaries
writeln("\n", "Dictionaries", "\n")

dict := Map clone
dict atPut("hello", "a greeting")
dict atPut("goodbye", "a parting")
dict hasKey("hello") println

dict at("hello") println
dict keys println
dict foreach(key, value, (key ..": ".. value) println)


# Strings
writeln("\n", "Strings", "\n")

a := "foo"
b := "bar"
c := a .. b 
c println // foobar

c at(0) println // 102 
c at(0) asCharacter println // f

s := "this is a test"
words := s split(" ") println 
words join(" ") println

s findSeq("is") println // 2
s findSeq("a") println // 8
s exSlice(10) println // test
s exSlice(2, 9) println // is is a


# Objects
writeln("\n", "Objects", "\n")

Contact := Object clone 
Contact type println // Contact
Contact proto type // Object
Contact name ::= nil 
Contact address ::= nil
Contact city ::= nil
Contact fullAddress := method(list(name, address, city) join("\n"))

holmes := Contact clone 
holmes setName("Holmes") setAddress("221B Baker St") setCity("London")
holmes name println // Holmes
holmes slotNames println // list(name, city, address)
holmes fullAddress println


Person := Object clone do(
	firstName ::= nil
	lastName ::= nil
	age ::= nil

	fullName := method("#{firstName} #{lastName}" interpolate)
	greet := method(
		"Hello, my name is #{fullName} and I'm #{age} years old." interpolate println)
)

fedya := Person clone
fedya setFirstName("Fedya")
fedya setLastName("Petrakov")
fedya setAge(21)
fedya fullName println
fedya greet


# Inheritance
writeln("\n", "Inheritance", "\n")

BusinessContact := Contact clone do(
	companyName ::= ""
	fullAddress := method(
		list(companyName, "Care of: " .. name, address, city) join("\n")
	)
)

steve := BusinessContact clone do(
	setName("Steve")
	setCompanyName("Apple Inc.")
	setAddress("1 Infinite Looop")
	setCity("Cupertino")
)
steve fullAddress println


# Lazy Evaluation
writeln("\n", "Lazy Evaluation", "\n")

assert := method(
	call sender doMessage(call message argAt(0)) ifFalse(
		Exception raise("failed assertion: " .. call message asString)
	)
)

// assert(1 == 3)


# Introspection
writeln("\n", "Introspection", "\n")

Address := Object clone do(
	fields ::= list("name", "street", "city", "state", "zipCode")

	init := method(
		fields foreach(key,
			if (self hasSlot(key) not,
				self newSlot(key, nil)	
			)	
		)
	)

	emptyFields := method(
		fields select(k, self getSlot(k) == nil)
	)

	isValid := method(errors size == 0)

	assertValid := method(
		if (emptyFields size,
			Exception raise (
				self type .. " missing: " .. emptyFields join(",")
			)
		)
	)
)

anAddress := Address clone setName("Alan") setStreet("6502 Mem Ln")

// anAddress assertValid


# Exceptions
writeln("\n", "Exceptions", "\n")

e := try(
	anAddress assertValid
)

// e catch(Exception,
// 	writeln("Caught: ", e error, "\nstack:\n", e coroutine backTraceString)
// )


# Namespace
writeln("\n", "Namespace", "\n")

Lobby slotNames println
Lobby protos Core slotNames println
Lobby protos Core Date slotNames println


# Code as data
writeln("\n", "Code as data", "\n")

m := method(a(b) + c)
getSlot("m") println
getSlot("m") message println
getSlot("m") message next println
getSlot("m") message name println
getSlot("m") message setName("foo") println
getSlot("m") message arguments println
Message slotNames println
