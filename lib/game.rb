require_relative './frame'

class Game
  attr_reader :game, :result, :counter, :frame_totals

  START_COUNTER = 1

  def initialize
    @game = Frame.new
    @result = 0
    @counter = START_COUNTER
    @frame_totals = []
  end

  def play_bowling
    9.times do 
      roll_one
      @result == 10 ? (p "strike!") : roll_two 
      end_of_frame
    end
    tenth_frame
    end_of_game
  end

  private

  def roll_one
    p "Round #{@counter}, roll 1:"
    @result = gets.chomp
    @result = @result.to_i
    @game.first_roll(@result)
  end

  def roll_two
    p "Round #{@counter}, roll 2:"
    @result = gets.chomp
    @result = @result.to_i
    @game.second_roll(@result)
  end

  def roll_bonus
    p "Round 10, Bonus roll:"
    @result = gets.chomp
    @result = @result.to_i
    @game.bonus_roll(@result)
  end

  def end_of_frame
    @counter += 1
    @result = 0
    total
  end

  def end_of_game
    print_scorecard
    @counter = START_COUNTER
    @game = Frame.new
    @frame_totals = []
  end

  def tenth_frame
    roll_one
    @result == 10 ? (p "strike!") : roll_two 
    end_of_frame
    if @game.bonus == "strike bonus"
      p "strike bonus rounds!"
      2.times { roll_bonus }
    elsif @game.bonus == "spare bonus"
      p "spare bonus round!"
      roll_bonus
    end 
  end

  def total
    current_total = @game.scorecard.map(&:values).flatten.compact.sum
    p current_total
    @frame_totals << current_total
  end

  def print_scorecard
    counter = 0
    @game.scorecard.each { |print|
      p "Frame: #{counter + 1}, roll: 1, pins knocked: #{@game.scorecard[counter][:roll1]}"
      p "Frame: #{counter + 1}, roll: 2, pins knocked: #{@game.scorecard[counter][:roll2]}, total: #{@frame_totals[counter]} (bonus: #{@game.scorecard[counter][:bonus_points]})"
      # if counter == 9
      # p "Frame: 10, bonus roll: 1, pins knocked: #{@game.scorecard[counter][:roll2]}, total: #{@frame_totals[counter]} (bonus: #{@game.scorecard[counter][:bonus_points]})"
      counter += 1
    }
  end

end
