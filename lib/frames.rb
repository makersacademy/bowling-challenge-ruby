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
    roll_again?
  end

  def roll_again?
    @roll.next_roll?
    if @roll.roll_again == true
      @first_roll = false
      new_roll
    else
      bonus(@bonus, @round)
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

  def bonus(bonus, round)
    if (bonus == 'strike') && (round == 10)
      bonus_roll
      bonus_roll
    elsif (bonus == 'strike') && (round == 10)
      bonus_roll
    elsif bonus == 'strike'
      # bonus is the next 2 rolls
    else
      # bonus is the next roll
    end
  end

  def bonus_roll
      @roll = Roll.new(score_count: @score_count, strike_count: @strike_count, first_roll: @first_roll, this_frame_count: @this_frame_count)
      @roll.scoring(pins_knocked)
      @score_count = @roll.score_count
      @strike_count = @roll.strike_count
  end

end