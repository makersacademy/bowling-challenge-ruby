require 'game'

class BowlingUserInterface
  def intiialize(io)
    @io = io
    @game = Game.new
  end

  def start_game
    @io.puts "Welcome to your bowling scorecard!"
    loop do
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
        ##
      when "3"
        puts "The game has finished"
      else
        puts "Please choose one of the listed options"
      end
    end
  end

  def rolls
    if game.frames.length < 9
      first_roll = @io.gets.chomp
      second_roll = @io.gets.chomp
      game.add_frame(first_roll, second_roll)
    else
      first_roll = @io.gets.chomp
      if first_roll == 10
        second_roll = @io.gets.chomp
        third_roll = @io.gets.chomp
        game.add_frame(first_roll, second_roll, third_roll)
      else
        second_roll = @io.gets.chomp
        if first_roll + second_roll == 10
          third_roll = @io.gets.chomp
          game.add_frame(first_roll, second_roll, third_roll)
        else
          game.add_frame(first_roll, second_roll)
        end
      end
    end
  end
end