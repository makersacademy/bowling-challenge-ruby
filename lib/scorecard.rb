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
    for i in 0..8 do
      if @total_score_array[i][:strike] == true
        @total = @total_score_array[i][:one].to_i + @total_score_array[i+1][:one].to_i + @total_score_array[i+1][:two].to_i
        @final_total += @total
        puts "Score until frame number #{i+1} is #{@final_total}"
      elsif @total_score_array[i][:one] + @total_score_array[i][:two] == 10
        @total = @total_score_array[i][:one].to_i + @total_score_array[i][:two].to_i + @total_score_array[i+1][:one].to_i
        @final_total += @total
        puts "Score until frame number #{i+1} is #{@final_total}"
      else
        @total = @total_score_array[i][:one].to_i + @total_score_array[i][:two].to_i
        @final_total += @total
        puts "Score until frame number #{i+1} is #{@final_total}"
      end
    end
    @final_total =  tenth_frame_total(@final_total)
    puts "TOTAL SCORE FOR THE GAME IS : #{@final_total}"
  end

  def tenth_frame_total(final_total)
    total = @total_score_array[9][:one].to_i + @total_score_array[9][:two].to_i + @total_score_array[10][:one].to_i
    final_total = final_total + total
    puts "Score until frame number 10 is #{final_total}"
    return final_total
  end

  def reseting_loop
    @total_of_frame = 0
    @counter += 1
  end


end  
