require 'pry'
require_relative 'hand'
require_relative 'card'
require_relative 'deck'

######################################################################
############################ METHODS #################################
######################################################################

def start_game
  deck = Deck.new
  5.times{deck.shuffle}
  deck
end

def prompt_player(player_hand)
  print 'Hit or Stand (H/S):'
  answer = gets.chomp
  if answer.match(/\Ah/i)
    "H"
    draw(player_hand, "Player")
  elsif answer.match(/\As/i)
    "S"
  else
    puts "invalid"
    prompt_player
  end
end

def draw(hand, who)
  hand = hand.draw
  new_hand = []
  hand.each do |card|
    new_hand << card.map{|k,v| k + v}
  end
  puts who + " was dealt " + new_hand[-1].join + "."
  return hand
end

######################################################################
############################ PROCEDURE ###############################
######################################################################

puts "Welcome to Blackjack!"
puts
deck = start_game

player_hand = Hand.new(deck)
2.times{draw(player_hand, "Player")}
player_score = player_hand.value
puts "Player score: #{player_score}"
puts
until prompt_player(player_hand) == "S"
  player_score = player_hand.value
  puts "Player score: #{player_score}"
    if player_score > 21
      puts
      puts "Bust! You lose."
      abort
    elsif player_score == 21
      puts
      puts "Blackjack! You win!"
      abort
    else
    end
  puts
end
puts

dealer_hand = Hand.new(deck)
2.times{draw(dealer_hand, "Dealer")}
dealer_score = dealer_hand.value
puts "Dealer score: #{dealer_score}"
until dealer_score >= 17
  draw(dealer_hand, "Dealer")
  dealer_score = dealer_hand.value
  puts "Dealer score: #{dealer_score}"
    if dealer_score > 21
      puts
      puts "Bust! You win!"
      abort
    end
  puts
end

if dealer_score > player_score
  puts "House wins. You lose."
elsif dealer_score < player_score
  puts "You win!"
else
  puts "Tie."
end
