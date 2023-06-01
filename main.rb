require_relative 'hangman_game.rb'

puts "start new game (1) or continue recent one (2)?:"
new_or_old = gets.chomp

unless [1,2].include?(new_or_old)
  puts "start new game (1) or continue recent one (2)?:"
  new_or_old = gets.chomp
end

if new_or_old == 1
  HangmanGame.new().start_game
elsif new_or_old == 2
  # load secret code and countdown 
  # set those
  # start_new_game
  HangmanGame.new(secret_code, countdown).start_game
end
