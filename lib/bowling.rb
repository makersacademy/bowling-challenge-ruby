class Bowling
  attr_reader :bonus, :total, :frame, :current_frame

  def initialize
    @bonus = 0
    @total = 0
    @frame = 1
    @current_frame = []
  end

  def add_roll(pins)
    raise 'The game is over!' unless game_continues?

    bonus? ? score = multiplier(pins) : score = pins

    apply_score(pins, score)
    end_frame if end_of_frame?
  end

  def end_frame
    @bonus += 1 if spare?
    @bonus += 2 if strike?
    @current_frame.clear
    @frame += 1
  end

  def multiplier(pins)
    double_bonus? ? pins * 3 : pins * 2
  end

  def apply_score(pins, score)
    if double_bonus?
      @bonus -= 2
    elsif bonus?
      @bonus -= 1
    end
    @total += score
    @current_frame << pins
  end

  def end_of_frame?
    if @frame < 10
      @current_frame.length == 2 || current_frame_sum == 10
    else
      @current_frame.length == 3 && current_frame_sum >= 10
    end
  end

  def spare?
    @current_frame.length == 2 && current_frame_sum == 10
  end

  def strike?
    @current_frame.length == 1 && @current_frame[0] == 10
  end

  def bonus?
    @bonus.positive?
  end

  def double_bonus?
    @bonus >= 3
  end

  def game_continues?
    @frame < 10 || (@frame == 10 && tenth_frame_exception?)
  end

  def tenth_frame_exception?
    @current_frame.length < 2 || (current_frame_sum >= 10 && @current_frame.length < 3)
  end

  def current_frame_sum
    @current_frame.inject(0, &:+)
  end
end