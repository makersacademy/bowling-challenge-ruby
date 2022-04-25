require_relative './game.rb'

class ScoreCard
  def initialize
    @game = Game.new
    @total_score_array = []
    @total_of_game_array = []
  end
  
  def score_controller
    @counter = 1
    @game.frame_manager
    @total_score_array = @game.total_score_array
  end

  def display_scorecard
    score_controller
    print @total_score_array
    @total_score_array.each do | scores|
      print " Frame number #{@counter}  =>"
      scores.each do |key, score|
        if key != :strike
          print " roll #{key} is #{score} "
        end
      end
     reseting_loop
    end
  end

  def score_final
    @total = 0
    @final_total = 0
    for i in 0...3 do
      if @total_score_array[i][:strike] == true
        @total = @total_score_array[i][:one] + @total_score_array[i+1][:one] + @total_score_array[i+1][:two]
        @final_total += @total
        puts "Score until frame number #{i+1} is #{@total}"
      elsif @total_score_array[i][:one] + @total_score_array[i][:two] == 10
        @total = @total_score_array[i][:one] + @total_score_array[i][:two] + @total_score_array[i+1][:one]
        @final_total += @total
        puts "Score until frame number #{i+1} is #{@total}"
      else
        @total = @total_score_array[i][:one] + @total_score_array[i][:two]
        @final_total += @total
        puts "Score until frame number #{i+1} is #{@total}"
      end
    end
    puts "TOTAL SCORE FOR THE GAME IS : #{@final_total}"
  end

  def reseting_loop
    @total_of_frame = 0
    @counter += 1
  end


end  
