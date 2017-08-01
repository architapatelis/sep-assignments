
require_relative 'actor'
require_relative 'film'


Kevin_Bacon = Actor.new("Kevin Bacon")
Lori_Singer = Actor.new("Lori Singer")
John_Lithgow = Actor.new("John Lithgow")
Dianne_Wiest = Actor.new("Dianne Wiest")
Chris_Penn = Actor.new("Chris Penn")
Sarah_Jessica_Parker = Actor.new("Sarah Jessica Parker")
Matthew_Mcconaughey = Actor.new("Matthew Mcconaughey")
Williem_Dafoe = Actor.new("Williem Dafoe")
James_Franco = Actor.new("James Franco")
Gene_Hackman = Actor.new("Gene Hackman")
Seth_Rogen = Actor.new("Seth Rogen")
Kate_Winslet = Actor.new("Kate Winslet")
Leonardo_Dicaprio = Actor.new("Leonardo Dicaprio")


# Footlose
footloose = Film.new("Footloose")
Kevin_Bacon.create_film_array(footloose)
Lori_Singer.create_film_array(footloose)
John_Lithgow.create_film_array(footloose)
Dianne_Wiest.create_film_array(footloose)
Chris_Penn.create_film_array(footloose)
Sarah_Jessica_Parker.create_film_array(footloose)


#Interstellar
interstellar = Film.new("Interstellar")
John_Lithgow.create_film_array(interstellar)
Matthew_Mcconaughey.create_film_array(interstellar)

#The Birdcage
birdcage = Film.new("The Birdcage")
Dianne_Wiest.create_film_array(birdcage)
Gene_Hackman.create_film_array(birdcage)

#Mississippi Burning
mississippi_burning = Film.new("Mississippi Burning")
Gene_Hackman.create_film_array(mississippi_burning)
Williem_Dafoe.create_film_array(mississippi_burning)

#Spider Man 3
spider_man = Film.new("Spider Man 3")
James_Franco.create_film_array(spider_man)
Williem_Dafoe.create_film_array(spider_man)

#Pineapple Express
pineapple_express = Film.new("Pineapple Express")
James_Franco.create_film_array(pineapple_express)
Seth_Rogen.create_film_array(pineapple_express)

#Steve Jobs
steve_jobs = Film.new("Steve Jobs")
Seth_Rogen.create_film_array(steve_jobs)
Kate_Winslet.create_film_array(steve_jobs)

#Titanic
titanic = Film.new("Titanic")
Kate_Winslet.create_film_array(titanic)
Leonardo_Dicaprio.create_film_array(titanic)

puts "TEST RESULTS: "
puts
puts

puts "James Franco Result: "
James_Franco.find_kevin_bacon
puts 'Expect: ["Spider Man 3", "Mississippi Burning", "The Birdcage", "Footloose"]
'

puts "-----------------------"

puts "Gene Hackman Result: "
Gene_Hackman.find_kevin_bacon
puts 'Expect: ["The Birdcage", "Footloose"]
'

puts "-----------------------"

puts "Leonardo Dicaprio Result: "
Leonardo_Dicaprio.find_kevin_bacon

puts "-------------------------"

puts "Kevin Bacon Result: "
p Kevin_Bacon.find_kevin_bacon
