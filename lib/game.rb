require_relative './frame'

class Game
  attr_reader :test_game, :result, :counter

  START_COUNTER = 1

  def initialize
    @test_game = Frame.new
    @result = 0
    @counter = START_COUNTER
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
    @test_game.first_roll(@result)
  end

  def roll_two
    p "Round #{@counter}, roll 2:"
    @result = gets.chomp
    @result = @result.to_i
    @test_game.second_roll(@result)
  end

  def roll_bonus
    p "Round 10, Bonus roll:"
    @result = gets.chomp
    @result = @result.to_i
    @test_game.bonus_roll(@result)
  end

  def end_of_frame
    @counter += 1
    @result = 0
    total
  end

  def end_of_game
    p "Final score: #{total}"
    # print full detailed scorecard
    @counter = START_COUNTER
    @test_game = Frame.new
  end

  def tenth_frame
    roll_one
    @result == 10 ? (p "strike!") : roll_two 
    end_of_frame
    if @test_game.bonus == "strike bonus"
      p "strike bonus rounds!"
      2.times { roll_bonus }
    elsif @test_game.bonus == "spare bonus"
      p "spare bonus round!"
      roll_bonus
    end 
  end

  def total
    score_total = @test_game.scorecard.map(&:values).flatten.compact.sum
    p score_total
  end

end
