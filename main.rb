require_relative 'hangman_game.rb'

def save_game(obj)
  File.open('old_game.txt', 'w') do |file|
    file.puts obj
  end
end

def get_old_game()
  old_game_file = File.read('old_game.txt')
  hangman_obj = Marshal.load(old_game_file)
end

puts "start new game (1) or continue recent one (2)?:"
new_or_old = gets.chomp

until ["1","2"].include?(new_or_old)
  puts "start new game (1) or continue recent one (2)?:"
  new_or_old = gets.chomp
end

if new_or_old == "1"
  hangman_obj = HangmanGame.new()
elsif new_or_old == "2"
  # load secret code and countdown 
  # set those
  # start_new_game
  hangman_obj = get_old_game()
end

if hangman_obj.play == "save"
  seredObj = Marshal.dump(hangman_obj)
  p seredObj
  save_game(seredObj)
end

