require_relative "user"
module Screen
  def self.clear_screen
    print "\e[H\e[2J"
    # print "\e[2J\e[F"
  end

  def self.clean_line
    print "\r" + ("\e[A\e[K")
  end
end

class Simon
  extend Screen
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq= []
  end

  def play
    while @game_over == false
      puts "Try Simon Game, remember as many as you can"
      take_turn
    end
    if @game_over == true
      game_over_message
      reset_game
    end
  end

  def take_turn
    if @game_over == false
      Screen.clear_screen
      show_sequence
      puts "Insert your guess and press Enter"
      puts "Green = g, Red = r, Yellow = y, Blue = b"
      if require_sequence == false
        @game_over = true
        return @game_over
      else
        round_success_message
        @sequence_length += 1
      end
    end
    # Screen.clear
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      # print "\r" + ("\e[A\e[K")
      Screen.clean_line
      puts color
      sleep(1)
      # print "\r" + ("\e[A\e[K")
      Screen.clean_line
    end
  end

  def require_sequence
    counter = 0
    while counter < @seq.length
      input = gets.chomp
      return false if control_sequence[counter] != input
      counter += 1
      Screen.clean_line
    end
    true
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Well done! Keep going!"
  end

  def game_over_message
    puts "Game Over"
    puts "Your correct answers were #{sequence_length-1} number"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def control_sequence
    control_arr = []
    @seq.each do |i|
      # color = "y" if @seq[i] == "yellow"
      if i == "yellow"
        control_arr << 'y'
      elsif i == "red"
        control_arr << 'r'
      elsif i == "blue"
        control_arr << 'b'
      else
        control_arr << 'g'
      end
    end
    return control_arr
  end
end

simon = Simon.new
simon.play

