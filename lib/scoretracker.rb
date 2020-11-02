class ScoreTracker

  attr_reader :scores, :frame_num, :totals

  def initialize 
    @scores = Hash.new(0)
    @totals = Hash.new(0)
    @frame_num = 1
  end

  def add_roll(roll)
    if new_frame?
      @scores[@frame_num] = [roll]
      add_frame_total if strike?(roll)
      update_frame if strike?(roll)
    else
      add_roll_to_frame(roll)
      add_frame_total
      update_frame
    end
  end

  def add_frame_total(frame = @frame_num)
    p @scores
    p @totals
    @totals[frame] = @scores[frame].sum
    if frame > 1
      add_bonuses(frame) if spare?(frame) && !last_frame?(frame)
      add_strike_bonuses(frame) if previous_strike?(frame)
    end
  end

  def update_frame
    @frame_num += 1 unless last_frame?
  end

  def see_current_total
    total = 0
    @totals.each do |frame, score| 
      total += score
    end
    total
  end

  def last_frame?(frame = @frame_num)
    frame == 10
  end

  def first_roll_strike?
    @scores[@frame_num][0] == 10
  end

  def third_roll?(frame = @frame_num)
    return false unless @scores.has_key?(frame)
    @scores[frame].count == 2
  end

  def fourth_roll?
    return false unless @scores.has_key?(@frame_num)
    @scores[@frame_num].count == 3
  end

  private

  def previous_strike?(frame)
    unless frame == 1
      first_roll = @scores[frame - 1][0]
      return strike?(first_roll)
    end
    false
  end

  def add_roll_to_frame(roll)
    if last_frame?
      raise 'Only two rolls allowed!' if third_roll? && !first_roll_strike?
      raise 'A max of three rolls are allowed!' if fourth_roll?
    end
    @scores[@frame_num] << roll
  end

  def add_bonuses(frame)
    @totals[frame - 1] += @scores[frame].sum
  end

  def add_strike_bonuses(frame)
    two_frames_ago = @scores[frame - 2][0]
    one_frame_ago = @scores[frame - 1][0]

    if last_frame?(frame) && third_roll?(frame)
      @totals[9] += @scores[10][0..1].sum
    elsif last_frame?(frame) && second_roll?(9)
      @totals[8] += (@scores[9][0] + @scores[10][0])
    elsif !last_frame?(frame) && strike?(one_frame_ago)
      @totals[frame - 2] += @totals[frame]
    elsif strike?(one_frame_ago)
      @totals[frame - 1] += @totals[frame]
    end
  end

  def spare?(frame)
    @totals[frame - 1] == 10 && spare_not_strike(frame)
  end

  def spare_not_strike(frame)
    @scores[frame - 1].count == 2
  end

  def strike?(roll)
    roll == 10
  end

  def new_frame?
    return true unless @scores.has_key?(@frame_num)
  end

  def second_roll?(frame)
    return false unless @scores.has_key?(@frame_num)
    @scores[@frame_num].count == 1
  end

end
