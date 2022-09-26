require_relative './lib/game.rb'
require_relative './lib/frame.rb'

class Application
  def initialize(io = Kernel)
    @io = io
  end

  def run
    n = 0
    @game = Game.new

    # For the first 9 frames the palyer can roll the ball and if it doesn't hit all the pins it can roll again
    while n < 9 do
      first_roll
      if @frame.roll_1 < 10
        second_roll
      end
      @game.add_frame(@frame)
      n += 1
    end

    # The 10th frame is a special one where the player can get a bonus roll
    first_roll
    if @frame.roll_1 < 10
      second_roll
      @game.add_frame(@frame)

      # If a player hits a spare they get an extra roll
      if @frame.spare?
        bonus_roll
        @game.add_frame(@frame)
      end
      

    # If a player hits a strike they get extra rolls
    elsif @frame.strike?
      @game.add_frame(@frame)
      bonus_roll

      if @frame.roll_1 < 10
        second_roll
        @game.add_frame(@frame)

      elsif @frame.strike?
        @game.add_frame(@frame)
        bonus_roll
        @game.add_frame(@frame)
      end
    end 
    @game
  end

  def score
    @io.puts "Your final score is #{@game.sum}"
  end

  private

  def first_roll
    @io.puts "Enter the first roll:"
    @frame = Frame.new
    @frame.roll_1 = @io.gets.chomp.to_i
  end

  def second_roll
    @io.puts "Enter the second roll:"
    @frame.roll_2 = @io.gets.chomp.to_i
  end

  def bonus_roll
    @io.puts "Enter the bonus roll:"
    @frame = Frame.new
    @frame.roll_1 = @io.gets.chomp.to_i
  end

end

# app = Application.new(Kernel)
# app.run
# app.score
