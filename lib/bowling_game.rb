require 'frame'

class BowlingGame
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_frame(frame)
    @frames << frame
  end

  def current_total_score
    return 0 if @frames == []
    sum = 0
    @frames.each_with_index do |frame, i|
      if frame.spare? && @frames[-1] != frame
        frame.add_spare_bonus(@frames[i + 1])
      end

      if frame.score.nil?
        sum += 0
      else
        sum += frame.score
      end
    end

    sum
  end

  private

  # def add_to_total(score)
  #   if score.nil?
  #     sum += 0
  #   else
  #     sum += score
  #   end
  # end
end