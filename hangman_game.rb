class HangmanGame
  attr_accessor :secret_code, :countdown

  def initialize(secret_code = select_random_word_from_dict(), countdown = 10)
    @secret_code = secret_code
    @countdown = countdown
  end

  def play()
    print_secret_code()
    puts ''

    print_display()
    until countdown == 0
      #print_true_false()
      print "Choose: quit game (0), save game (1) or pick a new letter (2):"
      game_mode = gets.chomp
      until ["0","1","2"].include?(game_mode)
        puts "Choose: quit game (0), save game (1) or pick a new letter (2):"
        game_mode = gets.chomp
      end
      if game_mode == "0"
        quit_game()
      elsif game_mode == "1"
        save_game()
      elsif game_mode == "2"
        continue_game()
      end
    end
    announce_player_looses()
  end

  private
  def select_random_word_from_dict()
    possible_words = []
    dict = File.open('google-10000-english-no-swears.txt')
    dict.each_line do |line|
      line.rstrip!.lstrip!
      if 5 <= line.length && line.length <= 12
        possible_words.push(line.upcase)
      end
    end
    rand_word_letter_arr = possible_words[rand(possible_words.length)].split('')
    help_hash_array = []
    rand_word_letter_arr.each do |letter|
      help_hash_array.push({
        letter: letter,
        found: false
      })
    end
    return help_hash_array    
  end

  def print_display()
    print "remaining guesses: #{self.countdown}   "
    display_guessed_letters()   
    puts ' ' 
  end

  def display_guessed_letters()
    self.secret_code.each do |hash|
      if hash[:found]
        print hash[:letter] + '  '
      else
        print '___  '
      end
    end
    puts ''
  end

  def continue_game()
    selected_letter = pick_letter()
    if self.secret_code.any? {|hash| hash[:letter] == selected_letter}
      update_guessed_letters(selected_letter)
      print_display()
      check_win()
    else
      decrease_countdown()
      print_display()
    end
  end

  def pick_letter()
    print "select one letter:"
    input = gets.chomp.upcase
    ascii_number = input.ord
    until input.length == 1 && ascii_number.between?(65, 90)
      puts "select one letter:"
      input = gets.chomp.upcase
      ascii_number = input.ord
    end
    return input
  end

  def update_guessed_letters(selected_letter)
    self.secret_code.each do |hash|
      if hash[:letter] == selected_letter
        hash[:found] = true
      end
    end
  end

  def check_win()
    if self.secret_code.all?{|hash| hash[:found] == true}
      announce_player_wins()
    end
  end

  def decrease_countdown()
    self.countdown -= 1
  end

  def announce_player_wins()
    puts "Congrats, you guessed the secret word!"
    quit_game()
  end

  def announce_player_looses()
    puts "You dont hava any more guesses left. You lost."
    quit_game()
  end

  def save_game()
    puts "S"
    # serialize game
    # safe: secret_code and countdown
    # save in file
    # quit_game()
  end

  def quit_game()
    exit
  end

  def print_secret_code()
    self.secret_code.each {|hash| print hash[:letter]}
    puts ''
  end

  def print_true_false()
    self.secret_code.each {|hash| print "#{hash[:found]} "}
    puts ''
  end

end