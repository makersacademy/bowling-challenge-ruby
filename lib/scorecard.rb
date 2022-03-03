
require './lib/frame'
class Scorecard

  def initialize
    @frame = Frame.new
    @scorecard = Array.new
    @frame_count = 0 
      10.times do
      frame = ["-","-","-"]
      @scorecard[@frame_count] = frame 
      @frame_count += 1
    end
    @frame_count = 0 
    @running_total = 0
    @strike_count = 0
   # @spare_count = 0 
    @scores = []
    @score_count = 0
   # @ball_rolls = 0
    @end_of_game = false
    @bonus_count = 0 
  end

  def roll(pins)
    p "END OF GAME '#{@end_of_game}'"
    if @end_of_game == true
      p "THE GAME HAS ENDED ! START A NEW ONE"
    end
   # @ball_rolls += 1 
   p "FRAME COUNT '#{@frame_count}'"
   p "CURRENT FRAME  '#{@scores[@score_count-1]}'"
   p "Bonus COunt '#{@bonus_count}'"
   if @frame_count == 10
      if @scores[@score_count-1] == "/"
        "@scorecard[9][2] '#{@scorecard[9][2]}'"
        "running tot  '#{@running_total}'"
        @running_total += pins
        @scorecard[9][2] = @running_total 
        @end_of_game = true
      elsif @scores[@score_count-1] == "X"
        p "SCORE BONUS FRAME  '#{@scores[@score_count-1]}'"
        "@scorecard[9][2] '#{@scorecard[9][2]}'"
        "running tot  '#{@running_total}'"
        @running_total += pins
        @scorecard[9][2] = @running_total 
        @bonus_count += 1
        if @bonus_count == 2
          @end_of_game = true
        end
      else
        @end_of_game = true
      end
      return
    end 


    if @frame.complete?  
      frame = @frame.roll(pins)  
      frame_length = frame.length - 1 
      @scorecard[@frame_count][frame_length] =  frame[frame_length]
      if  @frame.standard?
          @scores[@score_count] = "S"
          @score_count +=1
        standard_score 
      end 

      if @frame.spare? 
        @scores[@score_count] = "/"
        @score_count +=1   
        spare_score = @scorecard[@frame_count][0] + @scorecard[@frame_count][1]
        @running_total += spare_score
        @scorecard[@frame_count][2] = @running_total
        @scorecard[@frame_count][2] = "-" 
      end

      if @frame.strike? 
        @scores[@score_count] = "X"
        @score_count +=1   
      end 
      @frame = Frame.new
      @frame_count += 1 
    else 
      if @frame_count < 10
      frame = @frame.roll(pins) 
      frame_length = frame.length - 1 
      @scorecard[@frame_count][frame_length] =  frame[frame_length]
      if @scores[@score_count - 1] == "/"
          score_count =  @scorecard[@frame_count][0].to_i
          @scorecard[@frame_count - 1][2] = @running_total + score_count
          @running_total += score_count
      end
    end 
    end 
  end

  def standard_score
    standard_score = @scorecard[@frame_count][0] + @scorecard[@frame_count][1]
    @running_total += standard_score
    @scorecard[@frame_count][2] = @running_total
  end

  def spare_score 
      @scorecard[@frame_count-1][2] = (10 + @scorecard[@frame_count][0])  
      @running_total +=  @scorecard[@frame_count][0]
  end

  def strike_score 
  #   if @strike_count == 1
  #     the_current_frame =@frame[frame_count][0] + @frame[frame_count][1]
  #     the_strike = 10 + the_current_frame
  #     @running_total += the_strike
  #     @frame[@frame_count][2] = @running_total
  #       #@frame[@frame_count-1][2] = @running_total - the_current_frame
  #   end
  #   if @strike_count == 2
  #  # the_current_frame =@frame[frame_count][0] + @frame[frame_count][1]
  #     the_strike = 10 + 10 + @frame[frame_count][0]
  #     @running_total += the_strike
  #     @frame[@frame_count][2] = @running_total
  #   end
  #   @strike_count.times do
  #   @running_total += 30
  #    end 
  #   @strike_count = 0
  end

  def final_score
    p @scorecard
    @running_total
  end

 end