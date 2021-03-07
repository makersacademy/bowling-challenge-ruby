require_relative 'game'
require_relative 'frame'

class Ui

attr_reader :game, :scorecard

  def initialize (game = Game)
    @game = game.create
    @scorecard = []
  end

  def throw_1(points = gets.chomp.to_i)	
    game.roll(points)
  end

  def throw_2(points = gets.chomp.to_i)	
   game.roll(points)
  end

  def add_to_scorecard
    scorecard << game.get_score
  end

  def begin_frame
    game.begin_frame
  end

  def strike_bonus
    strike_bonus = scorecard[-1]
    scorecard[-2] = scorecard[-2] + strike_bonus  if scorecard[-2] == ([10] || [0,10])
  end

  def spare_bonus
    spare_bonus = scorecard[-1][0]
    scorecard[-2] = scorecard[-2] + [spare_bonus]  if scorecard[-2].sum == 10
  end
end