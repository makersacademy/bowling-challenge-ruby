class Bowling
  attr_reader :bonus, :total, :frame, :current_frame

  def initialize
    @bonus = 0
    @total = 0
    @frame = 1
    @current_frame = []
  end

  def add_roll(pins)
    bonus? ? score = 2 * pins : score = pins

    apply_score(pins, score)
    end_frame if end_of_frame?
  end

  private

  def end_frame
    @bonus += 1 if spare?
    @bonus += 2 if strike?
    @current_frame.clear
    @frame += 1
  end

  def apply_score(pins, score)
    @bonus += -1 if bonus?
    @total += score
    @current_frame << pins
  end

  def end_of_frame?
    if @frame < 10
      @current_frame.length == 2 ||  @current_frame.inject(0, &:+) == 10
    else
      @current_frame.length == 3
    end
  end

  def spare?
    @current_frame.length == 2 && @current_frame.inject(0, &:+) == 10
  end

  def strike?
    @current_frame.length == 1 && @current_frame[0] == 10
  end

  def bonus?
    @bonus > 0
  end
end
