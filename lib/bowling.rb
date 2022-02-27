class Bowling

  attr_reader :total_score, :frame

  def initialize
    @total_score = 0
    @frame = []
  end

  def total_frames(frame_scores)
    raise "Minimum of 10 frames must be entered" if frame_scores.count < 10
    frame_scores.map.with_index do |frame, index|
      unless index == 9 || index == 10 || index == 11
        if frame[0] == 10 && frame_scores[index+1][0] == 10
          frame_scores[index] = [frame[0],((frame_scores[index+1].sum)+(frame_scores[index+2].sum))]
        elsif frame[0] == 10 
          frame_scores[index] = [frame[0],(frame_scores[index+1].sum)]
        elsif frame[0] != 10 && frame.sum == 10
          frame_scores[index] = [frame[0],(frame[1] + (frame_scores[index+1][0]))]
        end
      end
    end
    p frame_scores
    frame_scores.each { |scores| @total_score += scores.sum }
  end

  # def frame_score(roll_1, roll_2)
  #   @total_score += (roll_1 + roll_2) unless roll_1 + roll_2 == 10
  #   if roll_1 == 10

  #   end
  #   @frame << 1
  # end



end