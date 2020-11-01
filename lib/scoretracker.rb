class ScoreTracker

  attr_reader :scores, :frame_num, :totals

  def initialize 
    @scores = Hash.new(0)
    @totals = Hash.new(0)
    @frame_num = 1
  end

  def add_roll(roll)
    if new_frame?
      @scores[@frame_num] = [roll.to_i]
      update_frame if strike?(roll)
    else
      add_roll_to_frame(roll)
      update_frame
    end
  end

  def add_frame_total(frame = @frame_num)
    add_bonuses(frame) if spare?(frame)
    @totals[frame] = @scores[frame].sum
  end

  def update_frame
    @frame_num += 1 unless last_frame?
  end

  private

  def add_roll_to_frame(roll)
    if last_frame?
      raise 'Only two rolls allowed!' if third_roll? && !first_roll_strike?
    end

    @scores[@frame_num] << roll.to_i
  end

  def first_roll_strike?
    @scores[@frame_num][0] == 10
  end

  def add_bonuses(frame)
    @totals[frame - 1] += @scores[frame].sum
  end

  def spare?(frame)
    @totals[frame - 1] == 10 && spare_not_strike(frame)
  end

  def spare_not_strike(frame)
    @scores[frame - 1].count == 2
  end

  def strike?(roll)
    roll == '10'
  end

  def last_frame?
    @frame_num == 10
  end

  def third_roll?
    @scores[@frame_num].count == 2
  end

  def new_frame?
    !@scores.has_key?(@frame_num)
  end
end
