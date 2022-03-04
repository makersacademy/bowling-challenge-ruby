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
    @scores = []
    @score_count = 0 
    @end_of_game = false
    @bonus_count = 0
    @strikes = []
    @final_pins = []
  end

  def roll(pins)
    if @end_of_game == true
      end_of_game
      return
    end
    # End of Game
    if @frame_count == 10
      bonus_rolls(pins)
      return
    end 
    # End of frame
    if @frame.complete? 
     if !@frame.strike?
      frame = @frame.roll(pins)  
      frame_length = frame.length - 1 
      @scorecard[@frame_count][frame_length] =  frame[frame_length]
     end
      if  @frame.standard?
        standard_frame
      end 
      if @frame.spare?
        spare_frame
      end
      # Check for a previous strike
      if (@frame.spare? ||  @frame.standard?) && ( @scores[@score_count-2] == "X")
        strike_score
      end 
      if !@frame.strike?
        @frame = Frame.new
        @frame_count += 1 
      end
    else
      # First ball of the frame
      if @frame_count < 10
        frame = @frame.roll(pins) 
        frame_length = frame.length - 1 
        @scorecard[@frame_count][frame_length] =  frame[frame_length]
        if @scores[@score_count - 1] == "/"
          score_count =  @scorecard[@frame_count][0].to_i
          @scorecard[@frame_count - 1][2] = @running_total + score_count
          @running_total += score_count
        end
      # Is this first ball is a strike - then start a new frame
        if @frame.strike?
          strike_frame
        end 
      end 
    end 
  end

  def standard_frame
    @scores[@score_count] = "S"
    @score_count +=1
    standard_score 
  end

  def spare_frame
    @scores[@score_count] = "/"
    @score_count +=1   
    spare_score = @scorecard[@frame_count][0] + @scorecard[@frame_count][1]
    @running_total += spare_score
    @scorecard[@frame_count][2] = @running_total
    @scorecard[@frame_count][2] = "-" 
  end

  def strike_frame
    @scores[@score_count] = "X" 
    @score_count +=1
    @strikes << 10
    @strike_count += 1
    @frame = Frame.new
    @frame_count += 1 
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
    the_store =  @scorecard[@frame_count][0] +  @scorecard[@frame_count][1] 
    current_frame_value =  @running_total - the_store 
    @running_total = current_frame_value 
    current_frame_count = @frame_count
    end_of_strike_count = current_frame_count - (@strike_count)
    int_frame_count = 1
    @strikes <<  @scorecard[@frame_count][0]
    @strikes <<  @scorecard[@frame_count][1]
    strike_start_frame = current_frame_count - @strike_count

    while  int_frame_count  < (@strike_count + 1) do
        @running_total += @strikes[0] +  @strikes[1] +  @strikes[2]
        @scorecard[strike_start_frame][2] = @running_total
        strike_start_frame += 1
         @strikes.shift(1)
        int_frame_count += 1
      end
    @strikes = []
    @strike_count = 0
    @running_total += the_store
   @scorecard[@frame_count][2] = @running_total
  end 

  def bonus_rolls(pins)
    if @scores[@score_count-1] == "/"
      "@scorecard[9][2] '#{@scorecard[9][2]}'"
      "running tot  '#{@running_total}'"
      @running_total += pins
      @scorecard[9][2] = @running_total 
      @end_of_game = true
    elsif @scores[@score_count-1] == "X"
      if @strike_count == 10
        @running_total = 280
      end
      @final_pins << pins
      @running_total += pins
     if @final_pins.sum == 20
      @running_total += 10
     end
     @scorecard[9][2] = @running_total 
      @bonus_count += 1
      if @bonus_count == 2
        @end_of_game = true
      end
    else
      @end_of_game = true
    end 
  end

  def final_score
    p @scorecard
    @running_total
  end

  def end_of_game
    return "THE GAME HAS ENDED! START A NEW ONE"
  end

 end