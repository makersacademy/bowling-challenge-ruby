require_relative './frame'

class Game
  attr_reader :test_game, :result, :counter

  def initialize
    @test_game = Frame.new
    @result = 0
    @counter = 1
  end

  def play_bowling
    20.times do 
      roll_one
      p @result
      @result == 10 ? (p "strike!") : roll_two 
      @counter += 1
      @result = 0
      total
    end
    "Final score: #{total}"
  end

  private
  
  def total
    score_total = @test_game.scorecard.map(&:values).flatten.compact.sum
    p score_total
  end

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

end
