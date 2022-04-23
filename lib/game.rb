class Game
  def initialize(rolls)
    @rolls = rolls
  end

  def score
    score = 0
    @rolls.each_with_index do |frame, i|
      next if i > 9
      frame_score = frame.inject(0,:+)
      score += frame_score
      if frame_score == 10
        if frame.length == 1
          if @rolls[i + 1].length == 1
            score += @rolls[i + 1][0] + @rolls[i + 2][0]
          else
            score += @rolls[i + 1].inject(0,:+)
          end
        else
          score += @rolls[i + 1][0]
        end
      end
    end
    score
  end
end
