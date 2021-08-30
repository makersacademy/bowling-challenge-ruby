class Scoring

  def initialize(frames)
    @frames = frames
    @scores = scores
  end

  def calculation
    calculation = []
    (0...@scores.length).each do |index|
      total = simple_add(index) if both_integers?(index)
      total = strike(index) if @scores[index][0] == :X
      total = spare(index) if @scores[index][1] == :/
      calculation  << [total]
    end
    calculation
  end

  private

  def scores
    score_array = []
    @frames.each do |frame|
      rolls = frame.values_at(:roll_1, :roll_2, :roll_3)
      score_array << rolls.compact
    end
    score_array
  end

  def both_integers?(index)
    (@scores[index][0].is_a? Integer) && (@scores[index][1].is_a? Integer)
  end

  def simple_add(index)
    @scores[index][0] + @scores[index][1]
  end

  def strike(index)
    next_index = index + 1
    return 10 + simple_add(next_index) if both_integers?(next_index)
    return 10 + 10 + two_ahead(next_index + 1) if double?(next_index)
    return 10 + 10 if @scores[next_index][1] == :/
  end

  def spare(index)
    next_index = index + 1
    return 10 + 10 if @scores[next_index][0] == :X
    return 10 + @scores[next_index][0] 
  end

  def double?(next_index)
    @scores[next_index][0] == :X
  end

  def two_ahead(two_indexes_ahead)
    value = @scores[two_indexes_ahead][0]
    value == :X ? 10 : value 
  end

end
