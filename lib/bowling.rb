class BowlingScore

  def initialize(sheet) # where sheet is an array of scores
    @score_sheet = sheet
    @fail = false
  end

  def fail_check

    @score_sheet.each do |score|
      if score != score.to_i || score > 10 || score < 0
        @fail = true
      end
    end

    fail "Score Sheet Provided is Not Readable." if @fail == true || @score_sheet.length > 21 || @score_sheet.length < 11

  end

  def quick_check
    return "Total Score: 0 (Gutter Game)" if @score_sheet.sum == 0
  end

  def final_score
    fail_check
    return quick_check unless nil

    #return "Total Score: 300 (Perfect Game!)"
  end

end
