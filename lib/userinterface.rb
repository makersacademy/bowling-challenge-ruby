require_relative './frame'
require_relative './game'

class UserInterface
  def initialize
    @game = Game.new
    @name = ""
  end

  def start
    print_welcome_message
    get_player_name
    while @game.current_frame_number < 9
      @game.new_frame(Frame.new)
      play_frame
      @game.update_score
      display_score
    end
    @game.new_frame(Frame.new)
    final_frame
    @game.update_score
    game_over
  end

  private

  def play_frame
    play_roll
    if @game.current_frame_object.strike?
      strike_message
    else
      play_roll
    end
    spare_message if @game.current_frame_object.spare?
  end

  def final_frame
    play_roll
    play_roll
    play_roll if @game.current_frame_object.spare? || @game.current_frame_object.strike?
  end

  def play_roll
    puts "Frame number #{@game.current_frame_number}, roll #{@game.current_frame_object.current_roll_number}. "
    pins_knocked = ""
    while pins_knocked == ""
      print "Pins knocked:  "
      pins_knocked = edge_handle(gets.chomp)
      puts ""
    end
    @game.knocked(pins_knocked)
  end

  # ensuring a valid score is given

  def edge_handle(input)
    if !!(input =~ /[^0-9]/)
      puts "\nPlease input an integer!"
      return ""
    elsif input.to_i > 10
      puts "\nThere are only 10 pins to knock over, please check the score and try again."
      return ""
    elsif @game.current_frame_object.pins_knocked + input.to_i > 10 && @game.current_frame_number < 10
      puts "\nOnly ten pins can be knocked over in a frame, please check the score and try again."
      return ""
    else
      return input.to_i
    end
  end

  # methods for printing and taking input only

  def print_welcome_message
    puts "\nThank you for using this amazing command line bowling scorecard, good luck!\n"
  end

  def get_player_name
    print "\nWhat is your name?  "
    @name = gets.chomp.downcase.capitalize
    puts "Thank you #{@name} and again, good luck!"
    puts ""
  end

  def strike_message
    puts "Congratulations #{@name}! That's a strike!"
    puts ""
  end

  def spare_message
    puts "Nice one #{@name}, that's a spare!"
    puts ""
  end

  def display_score
    puts "#{@name}, your current score is #{@game.running_score}."
    puts ""
  end

  def game_over
    puts "Thank you for playing #{@name}, your final score is #{@game.running_score}."
  end

end

# the below are there to start the run

ui = UserInterface.new
ui.start
