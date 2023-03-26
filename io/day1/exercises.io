#
Person := Object clone
Person numOfLegs := 2

fedya := Person clone
fedya numOfLegs := 10

writeln(fedya ?numOfLegs)
writeln(fedya slotNames)

#  creates slot, assignes value, creates setter
andrey ::= Object clone
writeln(andrey)

# creates slot, assignes value
dima := Person clone
writeln(dima) 

# updates slot
andrey = Person clone
writeln(andrey)