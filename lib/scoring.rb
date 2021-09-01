class Scoring

  def initialize(frames)
    @frames = frames
    @scores = scores
  end

  def calculation
    (0...@scores.length).map do |idx|
      final_frame?(idx) ? [final_frame_total(idx)] : [frame_total(idx)]
    end
  end

  private

  def scores
    @frames.map do |frame|
      frame.values_at(:roll_1, :roll_2, :roll_3).compact
    end
  end

  def frame_total(idx)
    both_ints?(idx) ? add(idx) : one_roll?(idx) ? @scores[idx][0] : bonuses(idx)
  end

  def bonuses(idx)
    frame = @scores[idx]
    frame[0] == :X ? strike(idx) : frame[1] == :/ ? spare(idx) : nil
  end

  def both_ints?(idx, roll_1 = 0, roll_2 = 1)
    (@scores[idx][roll_1].is_a? Integer) && (@scores[idx][roll_2].is_a? Integer)
  end

  def add(idx, roll_1 = 0, roll_2 = 1)
    @scores[idx][roll_1] + @scores[idx][roll_2]
  end

  def spare(idx)
    next_frame = @scores[idx + 1]
    next_frame.nil? ? 10 : next_frame[0] == :X ? 20 : 10 + next_frame[0]
  end

  def strike(idx)
    return 10 if @scores[idx + 1].nil?

    return ints_strike(idx) if both_ints?(idx + 1)

    return double(idx) if double?(idx)

    return 20 if @scores[idx + 1][1] == :/

    10 + @scores[idx + 1][0]
  end
  
  def ints_strike(idx)
    10 + add(idx + 1)
  end

  def double?(idx)
    @scores[idx + 1][0] == :X
  end

  def double(idx)
    20 + two_ahead(idx + 2)
  end

  def two_ahead(two_indexes_ahead)
    value = @scores[two_indexes_ahead][0]
    value == :X ? 10 : value 
  end

  def one_roll?(idx)
    (@scores[idx][0].is_a? Integer) && @scores[idx][1].nil?
  end

  def final_frame?(idx)
    !@scores[idx][2].nil?
  end

  def final_frame_total(idx)
    return 10 + 10 if @scores[idx][1] == :/ && @scores[idx][2] == :X

    return 10 + @scores[idx][2] if @scores[idx][1] == :/
    
    return 30 if @scores[idx].all?(:X)
    
    return 10 + add(idx, 1, 2) if both_ints?(idx, 1, 2)
    
    10 + 10 + @scores[idx][@scores[idx].index { |n| n.is_a? Integer }]
  end

end
