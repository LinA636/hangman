class HangmanGame
  attr_accessor :secret_code, :countdown

  def initialize(secret_code = [], countdown = 10)
    @secret_code = secret_code
    @countdown = countdown
  end

  def start_game()
    # unless countdown == 0 do
      # choice: pick letter(continue game), save game or quit game
  end

  private
  def select_word_from_dict()
    # load directory: File.read(filename)
    #
    # select a word between 5 to 12 characters
    # case-sensitive: all big characters
    # safe each latter in hash: letter, and found (t/f)
    # push each hash into an array
  end

  def print_display()
    display_guessed_letters()
    puts "\nremaining guesses: #{self.countdown}"
  end

  def display_guessed_letters()
    # for each unguessed letter (found == false) display _
    # for each guessed letter display letter
  end

  def continue_game()
    # self.secret_code= create_secret_code()
    # print_display()
    # pick_letter()
    # check if picked_letter is included in secret code
      # yes: update_guessed_letters()
      #     if word is guessed:
      #         announce_player_wins()
      #     else: retrun
      # no: decrease_countdown()
      #     return
  end

  def pick_letter()
    # let player pick letter
    # check if letter is a letter and not specail sign
    # if not letter: warning + pick_letter()
    # upcase letter
    # return letter
  end

  def decrease_countdown()
    self.countdown -= 1
  end

  def announce_player_wins()
    puts "Congrats, you guessed the secret word!"
    quit_game()
  end

  def save_game()
    # serialize game
    # safe: secret_code and countdown
    # save in file
    # quit_game()
  end

  def quit_game()
    # delete progress
    # exit
  end

end