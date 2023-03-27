# Loops
writeln("\n", "Loops", "\n")

// infinite loop
// loop("getting dizzy..." println)
for(i, 1, 5, i println)
for(i, 1, 8, 2, i println)


# Conditions
writeln("\n", "Conditions", "\n")

f := if(false) then("It's false") else("It's true")
t := if(true, "It's true", "It's false")
t println 

# Operators
writeln("\n", "Operators", "\n")

OperatorTable println

OperatorTable addOperator("xor", 11)
true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))


# Messages
writeln("\n", "Messages", "\n")

postOffice := Object clone
postOffice packageSender := method(call sender)
postOffice messageTarget := method(call target)
postOffice messageArgs := method(call message arguments)
postOffice messageName := method(call message name)

mailer := Object clone
mailer deliver := method(postOffice packageSender)

mailer deliver println
postOffice messageTarget println
postOffice messageArgs("one", 2, :three) println
postOffice messageName println


unless := method(
	(call sender doMessage(call message argAt(0))) ifFalse(
	call sender doMessage(call message argAt(1))) ifTrue(
	call sender doMessage(call message argAt(2)))
)

unless(1 == 2, writeln("It's false"), writeln("It's true"))


westley := Object clone do(
	trueLove := true
)
princessButtercup := Object clone do(
	trueLove := false
)

westley isLoveTrue := method(
	princessButtercup unless(trueLove, ("It is false love" println), ("It is true love") println)
)
westley isLoveTrue


# Introspection
writeln("\n", "Introspection", "\n")

Object ancestors := method(
	prototype := self proto
	
	if(prototype != Object) then(
		writeln("Slots of ", prototype type, "\n------------------")
		prototype slotNames foreach(slotName, writeln(slotName))
		writeln
		prototype ancestors
	)
)

Animal := Object clone
Animal speak := method("ambiguous animal noise" println)

Duck := Animal clone
Duck speak := method("quack" println)
Duck walk := method("waddle" println)

disco := Duck clone
disco ancestors
