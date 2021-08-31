class Scoring

  def initialize(frames)
    @frames = frames
    @scores = scores
  end

  def calculation
    calculation = []
    (0...@scores.length).each do |idx|
      calculation << [frame_total(idx)]
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

  def frame_total(idx)
    return final_frame(idx) unless @scores[idx][2].nil?

    return simple_add(idx) if both_integers?(idx)

    return strike(idx) if @scores[idx][0] == :X

    return spare(idx) if @scores[idx][1] == :/

    @scores[idx][0] if single_roll?(idx)
  end

  def both_integers?(idx, idx1 = 0, idx2 = 1)
    (@scores[idx][idx1].is_a? Integer) && (@scores[idx][idx2].is_a? Integer)
  end

  def simple_add(idx, idx1 = 0, idx2 = 1)
    @scores[idx][idx1] + @scores[idx][idx2]
  end

  def strike(idx)
    nxt = next_index(idx)
    return 10 if @scores[nxt].nil?

    return 10 + simple_add(nxt) if both_integers?(nxt)

    return 10 + 10 + two_ahead(nxt + 1) if double?(idx)

    return 10 + 10 if @scores[nxt][1] == :/

    10 + @scores[nxt][0]
  end

  def spare(idx)
    nxt = next_index(idx)
    return 10 if @scores[nxt].nil?

    return 10 + 10 if @scores[nxt][0] == :X

    10 + @scores[nxt][0] 
  end

  def double?(idx)
    @scores[next_index(idx)][0] == :X
  end

  def two_ahead(two_indexes_ahead)
    value = @scores[two_indexes_ahead][0]
    value == :X ? 10 : value 
  end

  def single_roll?(idx)
    (@scores[idx][0].is_a? Integer) && @scores[idx][1].nil?
  end

  def final_frame(idx)
    return 10 + 10 if @scores[idx][1] == :/ && @scores[idx][2] == :X

    return 10 + @scores[idx][2] if @scores[idx][1] == :/
    
    return 30 if @scores[idx].all?(:X)
    
    return 10 + simple_add(idx, 1, 2) if both_integers?(idx, 1, 2)
    
    10 + 10 + @scores[idx][@scores[idx].index { |n| n.is_a? Integer }]
  end

  def next_index(idx)
    idx + 1
  end
end
