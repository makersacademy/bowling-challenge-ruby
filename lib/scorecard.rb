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
    @spare_count = 0
  end

  def roll(pins)

    if @frame.complete?  
     if  @frame.standard?
        frame = @frame.roll(pins)
        frame_length = frame.length - 1 
        @scorecard[@frame_count][frame_length] =  frame[frame_length]
        standard_score 
      end
    if @frame.spare? 
       @scorecard[@frame_count][2] = "-"
         if @spare_count < 1
           @starting_frame_count = @frame_count
         end
       @spare_count += 1
    end
        @frame = Frame.new
        @frame_count += 1
    else
      frame = @frame.roll(pins)
      frame_length = frame.length - 1 
      @scorecard[@frame_count][frame_length] =  frame[frame_length]
      if @spare_count >= 1
        spare_score
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
     if  @frame.standard? 
      while(@starting_frame_count < @frame_count)  
        score1 = @scorecard[@starting_frame_count+2][0].to_i 
        score2 = @scorecard[@starting_frame_count][2] + 10 + score1 
        @scorecard[(@starting_frame_count+1)][2] = score2
        @starting_frame_count += 1 
      end
      @starting_frame_count = 0
     end 
  end

  def strike_score 
    if @strike_count == 1
      the_current_frame =@frame[frame_count][0] + @frame[frame_count][1]
      the_strike = 10 + the_current_frame
      @running_total += the_strike
      @frame[@frame_count][2] = @running_total
        #@frame[@frame_count-1][2] = @running_total - the_current_frame
    end
    if @strike_count == 2
   # the_current_frame =@frame[frame_count][0] + @frame[frame_count][1]
      the_strike = 10 + 10 + @frame[frame_count][0]
      @running_total += the_strike
      @frame[@frame_count][2] = @running_total
    end
    @strike_count.times do
    @running_total += 30
     end 
    @strike_count = 0
  end



  def final_score
    p @scorecard
    @running_total
  end

 end
