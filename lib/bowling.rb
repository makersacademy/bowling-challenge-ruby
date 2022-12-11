class Bowling
  def initialize(io)
    @io = io
    @scores = Array.new(10) { [] }
  end

  def regular_frame(round)
    round += 1
    start_round(round)
    score1 = retrieve_score1
    add_to_current_frame_score(score1,round)
    if score1 == 10
      double_bonus_first_round(round)
    else
      score2 = retrieve_next_score(score1)
      add_to_current_frame_score(score2,round)
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
    add_to_last_two_frame_scores(score1,round)
    if score1 == 10
      double_bonus_first_round(round)
    else
      score2 = retrieve_next_score(score1)
      add_to_current_frame_score(score2,round)
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
    add_to_last_two_frame_scores(score1,round)
    if score1 == 10
      double_bonus_second_round(round)
    else
      score2 = retrieve_next_score(score1)
      add_to_last_two_frame_scores(score2,round)
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
    add_to_last_three_frame_scores(score1,round)
    if score1 == 10
      double_bonus_second_round(round)
    else
      score2 = retrieve_next_score(score1)
      add_to_last_two_frame_scores(score2,round)
    end
    if score1 + score2 == 10
      single_bonus_round(round)
    else
      regular_frame(round)
    end
  end

  def start_round(round)
    @io.puts "Frame: #{round}" if round <= 10
    final_round if round == 11
  end

  def final_round
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
    end_game
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

  def end_game
    total = @scores.flatten.sum
    round_scores = @scores.map(&:sum)
    @io.puts "Round by Round Scores: #{round_scores.join(', ')}"
    @io.puts "Total Score: #{total}"
    exit
  end

  def run
    game = Bowling.new(Kernel)
    game.regular_frame(0)
  end

  def add_to_current_frame_score(score,round)
    @scores[round - 1] << score
  end

  def add_to_last_two_frame_scores(score,round)
    @scores[round - 1] << score
    @scores[round - 2] << score
  end

  def add_to_last_three_frame_scores(score,round)
    @scores[round - 1] << score
    @scores[round - 2] << score
    @scores[round - 3] << score
  end
end
