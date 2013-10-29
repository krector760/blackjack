def calculate_total(cards)
  arr = cards.map{|e| e[1]}

  total = 0
  arr.each do |value|
  	if value =="A"
  		total += 11
    elsif value.to_i == 0
    	total += 10
    else
    	total += value.to_i
    end	
  end

  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21 
  end	
  

  total
end	


# start and deck construct

puts "Welcome to BlackJack"
puts ""
puts "What is your name?"
playername = gets.chomp

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)

deck.shuffle!

# Deal Cards

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

#show cards

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of: #{dealertotal}"
puts "#{playername} has: #{mycards[0]} and #{mycards[1]}, for a total of: #{mytotal}"
puts ""

#players turn
if mytotal == 21
	puts "Congrats, #{playername} you hit BlackJack! You Win!"
	exit
end

while mytotal < 21
  puts "What would you like to do #{playername}? 1) hit or 2) stay"
  hit_or_stay = gets.chomp
  
  if !['1', '2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2"
    next
  end

  if hit_or_stay == "2"
  	puts "You chose to stay."	
  	break;
  end	

#hit
  new_card = deck.pop
  puts "Dealing card to #{playername}: #{new_card}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "your total us now: #{mytotal}"

 if mytotal == 21
  	puts "Congratulations #{playername}, you hit Blackjack! You win!"
  	exit
  elsif mytotal > 21
    puts "Sorry, You Busted #{playername}1!! HA HA!"
    exit
 end
end
 
 #dealer's turn
if dealertotal == 21
 	puts "Sorry Dealer hit BlackJack"
 	exit
end

while dealertotal < 17
 	new_card = deck.pop
 	puts "the Dealer pulled: #{new_card}"
 	dealercards << new_card
 	dealertotal = calculate_total(dealercards)
 	puts "the Dealer has: #{dealertotal}"
 	if dealertotal == 21
 		puts "Sorry Dealer hit 21. You Lose"
 		exit
 	elsif dealertotal > 21
 		puts "congratulations, dealer busted! You Win!"
 		exit
 	end
 end

#compare
puts "dealer's cards: "
dealercards.each do |cards|
	puts "=> #{cards}"
end

puts "your cards"
mycards.each do |cards|
	puts "=> #{cards}"
 end

 if dealertotal > mytotal
 	puts "sorry dealer won"
 elsif dealertotal < mytotal
 	puts "You win"
 else 
 	puts "Its a Tie!"
 end

exit





 		


