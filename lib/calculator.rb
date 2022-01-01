class Calculator

  def initialize
    @rolls = {}
    @strikes = {}
    @scores_per_turn = {}
    @current_score
  end

  def calculate_score(rolls,strikes,turn)
    @rolls = rolls
    @strikes = strikes
    @turn = turn
    @checking_turn = 1
    until @checking_turn == @turn
      @scores_per_turn[@turn] = score_on_turn
      @checking_turn += 1
    end
  end

  def score_on_turn
    score = 0
    @rolls[@turn].each do |ele|
      score += ele
    end
    score += strikes_scores
    return score
  end

  def strikes_scores
    if (@rolls[(@turn + 1)] != nil || @turn == 10)
      0
    else
      if @strikes[@turn] == "X"
        strikes
      elsif @strikes[@turn] == "/"
          @rolls[(@turn + 1)][0]
      else
        0
      end
    end
  end

  def strikes
    to_add = 0
      if @rolls[(@turn + 1)].count = 2
        to_add = @rolls[(@turn + 1)][0] + @rolls[(@turn + 1)][1]
      elsif @rolls[(@turn + 2)] != nil
        to_add = @rolls[(@turn + 1)][0] + @rolls[(@turn + 2)][0]
      else
        to_add = @rolls[(@turn + 1)][0]
      end
  end

end