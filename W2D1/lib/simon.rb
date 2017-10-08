class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    puts ""
    5.times do
      sleep(1)
      print '*'
    end

    system('clear')
    require_sequence

    @game_over = true if @user_seq != @seq

    puts ""
    round_success_message
    @sequence_length += 1

  end

  def show_sequence
    add_random_color
    puts "Take a look: you have 5 seconds!"
    puts ""
    puts @seq
  end

  def require_sequence
    puts "Enter in the colors in order! Use spaces please."
    @user_seq = gets.chomp.split(" ")
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Well played.\n"
  end

  def game_over_message
    puts "Game over, yyyeeeeaaaahhh!!!\n"
  end

  def reset_game
    puts "We'll play again sometime!"
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
