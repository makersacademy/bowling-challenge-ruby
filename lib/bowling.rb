class BowlingScore

  def initialize(sheet) # where sheet is an array of scores
    @score_sheet = sheet.each_slice(2).to_a
    @total_score = 0
  end

  def special_check
    return "Total Score: 0 (Gutter Game)" if @total_score == 0
    return "Total Score: 300 (Perfect Game!)" if @total_score == 300
  end

  def get_total
    frame = 0
    while frame <= 9 # frame will represent the index of the first 10 frames (0-9)

      score_one = (@score_sheet[frame][0])  # stores the scores of each frame
      score_two = (@score_sheet[frame][1])

      next_frame = frame + 1

      if score_one == 10  # (if strike) add ten + next two scores
        @total_score += 10 + @score_sheet[next_frame][0]

        if @score_sheet[next_frame][1] == "-"
          @total_score += @score_sheet[next_frame+1][0]
        else
          @total_score += @score_sheet[next_frame][1]
        end

      elsif score_one + score_two == 10 # (if spare) add ten + next score
        @total_score += 10 + @score_sheet[next_frame][0]
      else
        @total_score += score_one + score_two  # (else) adds scores as normal
      end

      frame += 1  # on to the next frame
    end
  end

  def final_score
    get_total
    return special_check unless special_check == nil
    return "Total Score: #{@total_score}"
  end

end
