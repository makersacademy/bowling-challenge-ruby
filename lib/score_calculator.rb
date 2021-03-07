class ScoreCalculator
  # [[1, 4], [4, 5], [6, 4], [5, 5], [10], [0, 1], [7, 3], [6, 4], [10], [2, 8, 6]]
  def calculate(frames)
    total_score = 0

    frames.each_cons(3) do |current_frame, next_frame, third_frame|
      total_score += calculate_frame(current_frame, next_frame, third_frame)
    end

    # second to last
    total_score += calculate_frame(frames[-2], frames[-1])

    # last frame
    total_score += frames.last.sum

    return total_score 
  end

  def calculate_frame(current_frame, next_frame, third_frame = [])
    bonus_score = 0
    base_score = current_frame.sum

    if base_score == 10 
      if current_frame.length == 1 
        # strike
        if next_frame.length == 1
          #next strike
          bonus_score = next_frame[0] + third_frame[0]
        else
          bonus_score = next_frame[0] + next_frame[1]
        end
      elsif current_frame.length == 2
        # spares
        bonus_score = next_frame[0]
      end
    end

    return base_score + bonus_score
  end

end
