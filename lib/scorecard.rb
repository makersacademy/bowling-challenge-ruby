require './lib/frame'
class Scorecard

    attr_accessor :scorecard, :totalscore
     
  def initialize  
    @scorecard =  []
  #  @total_score
  end

  def score(frame, complete)
    frame_score = []
    if complete == true
      frame_score[0] = frame[0]
      frame_score[1] = frame[1]
      frame_score[2] = frame.sum
    else
      frame_score[0] = frame[0]
      frame_score[1] = frame[1]
      frame_score[2] = ""
    end
    @scorecard << frame_score
  end

  def game_total
    number_frames = scorecard.length
    @scorecard[number_frames-1][2] 
  end

end