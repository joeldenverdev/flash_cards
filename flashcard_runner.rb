# require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'


card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
card_4 = Card.new('Who was the first African American president?', 'Obama', :History)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)


puts
puts "Welcome! You're playing with #{cards.size} cards."
puts "-------------------------------------------------"

card_count = round.deck.cards.length
categories_used = []
card_count.times do |num|
  puts "This is card number #{num+1} out of #{card_count}."

  current_question = round.current_card.question
  puts "Question: #{current_question}"

  categories_used << round.current_card.category

  guess = gets.chomp
  feedback = round.take_turn(guess).feedback
  puts "#{feedback}"
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.size} for a total score of #{round.percent_correct}%."

categories_used.uniq!

categories_used.each do |category|
  puts "#{category.to_s.tr(':', '')} - #{round.percent_correct_by_category(category)}% correct"
end
