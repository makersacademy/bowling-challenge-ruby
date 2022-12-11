class Game

  def initialize
    @frames = []
    @strike = false
    @spare = false
    @new_array = []
  end

  def add_frame(frame)
    @frames << frame
  end

  def total_score

    @frames.each do |frame|

      if @strike == true
        @new_array << frame.frame_score + frame.scores[0..1].sum
        @strike = false
      elsif @spare == true
        @new_array << frame.frame_score + frame.scores[0]
        @spare = false
      else
        @new_array << frame.frame_score
      end

      if @new_array.length == 10 && frame.scores[0] == 10
        @new_array << frame.scores[1..2].sum
      elsif @new_array.length == 10 && frame.scores[0..1].sum == 10
        @new_array << frame.scores[2]
      end

      if frame.strike?
        @strike = true
      elsif frame.spare?
        @spare = true
      end

    end

    @new_array.sum
  end

end