# frozen_string_literal: true

class Calculator
  def initialize
    @rolls = {}
    @strikes = {}
    @scores_per_turn = {}
    @current_score
  end

  def calculate_score(rolls, strikes, turn)
    @rolls = rolls
    @strikes = strikes
    @turn = turn
    @checking_turn = 1
    until @checking_turn == @turn
      @scores_per_turn[@checking_turn] = score_on_turn
      @checking_turn += 1
    end
    sum_of_scores
  end

  def sum_of_scores
    score = 0
    @scores_per_turn.each do |_key, val|
      score += val
    end
    score
  end

  def score_on_turn
    score = 0
    @rolls[@checking_turn].each do |ele|
      score += ele
    end
    score += strikes_scores
    score
  end

  def strikes_scores
    if @rolls[(@checking_turn + 1)].nil? || @checking_turn == 10
      0
    else
      case @strikes[@checking_turn]
      when 'X'
        strikes
      when '/'
        @rolls[(@checking_turn + 1)][0]
      else
        0
      end
    end
  end

  def strikes
    to_add = 0
    to_add = if @rolls[(@checking_turn + 1)].count >= 2
               @rolls[(@checking_turn + 1)][0] + @rolls[(@checking_turn + 1)][1]
             elsif @rolls[(@checking_turn + 2)] != nil
               @rolls[(@checking_turn + 1)][0] + @rolls[(@checking_turn + 2)][0]
             else
               @rolls[(@checking_turn + 1)][0]
             end
  end
end
