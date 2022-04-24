require_relative './game.rb'

class ScoreCard
  def initialize
    @game = Game.new
    @total_score_array = []
  end
  
  def score_controller
    @counter = 1
    @game.frame_manager
    @total_score_array = @game.total_score_array
  end

  def display_scorecard
    score_controller
    @total_score_array.each do | scores|
      print " Frame number #{@counter}  =>"
      scores.each do |key, score|
        print " roll #{key} is #{score} "
      end
      puts
      @counter += 1
    end
  end

end  
