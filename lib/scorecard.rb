require_relative './game.rb'

class ScoreCard
  def initialize
    @game = Game.new
    @total_score_array = []
    @total_of_frame = 0
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
        total_score(score)
      end
      puts "total score of this frame: #{@total_of_frame}"
      @total_of_frame = 0
      @counter += 1
    end
  end

  def total_score(score)
      @total_of_frame += score 
  end

end  
