class ScoreCalculator
  # [[1, 4], [4, 5], [6, 4], [5, 5], [10], [0, 1], [7, 3], [6, 4], [10], [2, 8, 6]]
  def calculate(frames)
    counter = 0
    total_score = 0

    frames.each_cons(2) do |current_frame, next_frame|
      puts("iteration: #{counter.inspect}")
      puts("current: #{current_frame.inspect}")
      puts("next: #{next_frame.inspect}")
      puts("")

      bonus_score = 0
      base_score = current_frame.sum

      if base_score == 10 
        if current_frame.length == 1 
          # strike
          bonus_score = next_frame[0] + next_frame[1]
        elsif current_frame.length == 2
          # spares
          bonus_score = next_frame[0]
        end           
      end

      total_score += base_score + bonus_score
            
      counter += 1
    end

    total_score += frames.last.sum

    return total_score 
  end

end
