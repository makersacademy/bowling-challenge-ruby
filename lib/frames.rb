require './lib/score_card'
require './lib/roll'

class Frames

  def initialize
    @round = 1
    @score_count = 0
    @strike_count = 0
    @bonus = nil
    @first_roll = true
    @this_frame_count = 0
  end

  def pins_knocked
    puts "How many pins did you knock down"
    pins = gets.chomp.to_i
  end


  def new_round
    if @round >= 11
      ScoreCard.new(@score_count, @strike_count)
    else
      new_roll
    end
  end

  def new_roll
    @roll = Roll.new(score_count: @score_count, strike_count: @strike_count, first_roll: @first_roll, this_frame_count: @this_frame_count)
    @roll.scoring(pins_knocked)
    @bonus = @roll.strike_or_spare
    @roll.next_roll?
    roll_again = @roll.roll_again
    puts "roll_again #{roll_again}"
    if roll_again == true
      @first_roll = false
      new_roll
    else
      new_frame
    end
  end

  def new_frame
    @round += 1
    @score_count = @roll.score_count
    @strike_count = @roll.strike_count
    @bonus = nil
    @first_roll = true
    @this_frame_count = 0
    new_round
  end

end