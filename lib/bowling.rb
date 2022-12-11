class Bowling
  def initialize(io)
    @io = io
    @scores = Array.new(10) { [] }
    @valid_inputs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  def regular_frame(round)
    round += 1
    start_round(round)
    score1 = retrieve_score1
    @scores[round - 1] << score1
    if score1 == 10
      double_bonus_first_round(round)
    else
      score2 = retrieve_next_score(score1)
      @scores[round - 1] << score2
    end
    if score1 + score2 == 10
      single_bonus_round(round)
    else
      regular_frame(round)
    end
  end

  def single_bonus_round(round)
    round += 1
    start_round(round)
    score1 = retrieve_score1
    @scores[round - 2] << score1
    @scores[round - 1] << score1
    if score1 == 10
      double_bonus_first_round(round)
    else
      score2 = retrieve_next_score(score1)
      @scores[round - 1] << score2
    end
    if score1 + score2 == 10
      single_bonus_round(round)
    else
      regular_frame(round)
    end
  end

  def double_bonus_first_round(round)
    round += 1
    start_round(round)
    score1 = retrieve_score1
    @scores[round - 1] << score1
    @scores[round - 2] << score1
    if score1 == 10
      double_bonus_second_round(round)
    else
      score2 = retrieve_next_score(score1)
      @scores[round - 1] << score2
      @scores[round - 2] << score2
    end
    if score1 + score2 == 10
      single_bonus_round(round)
    else
      regular_frame(round)
    end
  end

  def double_bonus_second_round(round)
    round += 1
    start_round(round)
    score1 = retrieve_score1
    @scores[round - 1] << score1
    @scores[round - 2] << score1
    @scores[round - 3] << score1
    if score1 == 10
      double_bonus_second_round(round)
    else
      score2 = retrieve_next_score(score1)
      @scores[round - 1] << score2
      @scores[round - 2] << score2
    end
    if score1 + score2 == 10
      single_bonus_round(round)
    else
      regular_frame(round)
    end
  end

  def retrieve_score1
    valid_scores = (0..10).to_a
    @io.puts 'Enter the score of the first bowl'
    get_valid_score(valid_scores)
  end

  def retrieve_next_score(score1 = 0)
    valid_scores = (0..(10 - score1)).to_a
    @io.puts 'Enter the score of the next bowl'
    get_valid_score(valid_scores)
  end

  def get_valid_score(valid_scores)
    score = @io.gets.chomp.to_i
    until valid_scores.include?(score)
      @io.puts 'Please enter a valid score!'
      score = @io.gets.chomp.to_i
    end
    score
  end

  def start_round(round)
    @io.puts "Frame: #{round}" if round <= 10
    check_if_final_round(round)
  end

  def check_if_final_round(round)
    if round == 11
      if @scores[9] == [10] and @scores[8] == [10, 10]
        @io.puts 'Bonus round'
        final_score1 = retrieve_next_score
        final_score2 = retrieve_next_score
        @scores[8] << final_score1
        @scores[9] << final_score1
        @scores[9] << final_score2
      elsif @scores[9] == [10] and @scores[8] != [10, 10]
        @io.puts 'Bonus round'
        final_score1 = retrieve_next_score
        final_score2 = retrieve_next_score
        @scores[9] << final_score1
        @scores[9] << final_score2
      elsif @scores[9].sum == 10
        @io.puts 'Bonus round'
        final_score = retrieve_next_score
        @scores[9] << final_score
      end
      @io.puts "Total Score: #{@scores.flatten.sum}"
      exit
    end
  end

  def run
    game = Bowling.new(Kernel)
    game.regular_frame(0)
  end
end