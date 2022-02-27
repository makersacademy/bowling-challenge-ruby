require './lib/frame'
class Scorecard

    #attr_accessor :scorecard, :frame_count, :running_total, :strike_count
  attr_accessor :scorecard
  def initialize  
    @scorecard =  []
    @strike_count = 0
    @running_total = 0
    @frame_count = 0
  end

  def score(frame, complete, standard_roll, is_strike)
    @frame_count += 1
    frame_score = [] 
    if is_strike == "Yes"
      frame_score[0] = frame[0]
      frame_score[1] = frame[1]
      frame_score[2] = frame[1]
      @scorecard << frame_score
      @strike_count += 1
      @scorecard
      # Perfect Game
      if @strike_count == 10
        @running_total = 300
        @scorecard[9][2] = 300
      end 
      return
    end
    # Completed Frame
    if complete == true 
      if standard_roll == true
        #check for previous strikes
         if @strike_count > 1
          if @strike_count == 1
            count = 10 + frame.sum
            @scorecard[@scorecard.length-2][2] = count
            @running_total += count
           end 
        end
        frame_score[0] = frame[0]
        frame_score[1] = frame[1]
        frame_score[2] = frame.sum
        @running_total += frame.sum
      else
        #  frame complete for standard roll
        frame_score[0] = frame[0]
        frame_score[1] = frame[1]
        frame_score[2] = frame[0]
      end
    else
      #frame incomplete
      frame_score[0] = frame[0]
      frame_score[1] = frame[1]
      frame_score[2] = ""
      #@scorecard << frame_score
    end
    @scorecard << frame_score
    @scorecard
  end

  def game_total
    number_frames = scorecard.length
    @scorecard[number_frames-1][2] 
  end

end