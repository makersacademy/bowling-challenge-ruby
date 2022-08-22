require_relative './game'

class UserInterface
  def initialize(io)
    @io = io
    @game = Game.new
  end

  def start_game
    @io.puts "Welcome to your bowling scorecard!"
    @io.puts "The game has started."
    loop do
      break if @game.frames.length == 10
      @io.puts "You're on frame number #{@game.frames.length + 1}."
      print_menu
      process(@io.gets.chomp)
    end
  end

  def print_menu
    @io.puts "Please choose an option"
    @io.puts "1. Play next frame"
    @io.puts "2. Show my score"
    @io.puts "3. End game"
  end

  def process(option)
    case option
      when "1"
        rolls
      when "2"
        score
      when "3"
        @io.puts "The game has finished"
        exit
      else
        @io.puts "Please choose one of the listed options"
    end
  end

  def rolls
    if @game.frames.length < 9
      @io.puts "Enter score for first roll"
      first_roll = user_input_to_integer
      if first_roll != 10
        @io.puts "Enter score for second roll"
        second_roll = user_input_to_integer       
        @game.add_frame(first_roll, second_roll)
      else
        @game.add_frame(first_roll)
      end
    else
      @io.puts "Enter score for first roll"
      first_roll = user_input_to_integer
      if first_roll == 10
        @io.puts "Enter score for second roll"
        second_roll = user_input_to_integer
        @io.puts "Enter score for third roll"
        third_roll = user_input_to_integer
        @game.add_frame(first_roll, second_roll, third_roll)
      else
        @io.puts "Enter score for second roll"
        second_roll = user_input_to_integer
        if first_roll + second_roll == 10
          @io.puts "Enter score for third roll"
          third_roll = user_input_to_integer
          @game.add_frame(first_roll, second_roll, third_roll)
        else
          @game.add_frame(first_roll, second_roll)
        end
      end
    end
  end

  def score
    @io.puts @game.calculate_current_score
  end

  def user_input_to_integer
    @io.gets.chomp.to_i
  end
end


# UserInterface.new(Kernel).start_game