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

  def both_ints?(idx, roll_1 = 0, roll_2 = 1)
    (@scores[idx][roll_1].is_a? Integer) && (@scores[idx][roll_2].is_a? Integer)
  end

  def add(idx, roll_1 = 0, roll_2 = 1)
    @scores[idx][roll_1] + @scores[idx][roll_2]
  end

  def one_roll?(idx)
    (@scores[idx][0].is_a? Integer) && @scores[idx][1].nil?
  end

  def bonuses(idx)
    frame = @scores[idx]
    frame[0] == :X ? strike(idx) : frame[1] == :/ ? spare(idx) : nil
  end

  def strike(idx)
    @scores[idx + 1].nil? ? 10 : both_ints_strike(idx)
  end

  def both_ints_strike(idx)
    both_ints?(idx + 1) ? 10 + add(idx + 1) : double(idx)
  end

  def double(idx)
    check = @scores[idx + 1][0] == :X && !@scores[idx + 2].nil?
    check ? 20 + two_ahead(idx + 2) : double_before_ff(idx)
  end

  def double_before_ff(idx)
    @scores[idx + 1][0] == :X ? 30 : strike_then_spare(idx)
  end

  def two_ahead(two_indexes_ahead)
    value = @scores[two_indexes_ahead][0]
    value == :X ? 10 : value 
  end

  def strike_then_spare(idx)
    @scores[idx + 1][1] == :/ ? 20 : 10 + @scores[idx + 1][0]
  end

  def spare(idx)
    next_frame = @scores[idx + 1]
    next_frame.nil? ? 10 : next_frame[0] == :X ? 20 : 10 + next_frame[0]
  end

  def final_frame?(idx)
    !@scores[idx][2].nil?
  end

  def final_frame_total(idx)
    ff_spare_then_strike?(idx) ? 20 : ff_spare(idx)
  end

  def ff_spare_then_strike?(idx)
    @scores[idx][1] == :/ && @scores[idx][2] == :X
  end

  def ff_spare(idx)
    @scores[idx][1] == :/ ? 10 + @scores[idx][2] : ff_strikes(idx)
  end

  def ff_strikes(idx)
    @scores[idx].all?(:X) ? 30 : ff_strike_then_ints(idx)
  end

  def ff_strike_then_ints(idx)
    both_ints?(idx, 1, 2) ? 10 + add(idx, 1, 2) : ff_two_strike_then_int(idx)
  end

  def ff_two_strike_then_int(idx)
    10 + 10 + @scores[idx][@scores[idx].index { |n| n.is_a? Integer }]
  end

end
