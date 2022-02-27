class Game

  FRAMES = 10

  def initialize
    @total = 0
    @rolls = []
  end

  def roll(pins_knocked_down)
    @rolls << pins_knocked_down
  end

  def score
    idx = 0
    fr_idx = 0
    FRAMES.times do
      last_frame_bonus(fr_idx += 1, idx)

      if strike?(idx)
        add_strike_bonus(idx)
        idx += 1
      elsif spare?(idx)
        add_spare_bonus(idx)
        idx += 2
      else
        frame_score(idx)
        idx += 2
      end

    end
    @total
  end

  private

  def frame_score(idx)
    @total += @rolls[idx] + @rolls[idx + 1]
  end

  def add_spare_bonus(idx)
    @total += 10 + @rolls[idx + 2]
  end

  def add_strike_bonus(idx) 
    @total += 10 + @rolls[idx + 1] + @rolls[idx + 2]
  end

  def strike?(idx)
    @rolls[idx] == 10
  end

  def spare?(idx)
    @rolls[idx] + @rolls[idx + 1] == 10
  end

  def last_frame_bonus(fr_idx, idx)
    return unless fr_idx == 10
    if @rolls[idx + 2] == 10
      extra = 0
    elsif !@rolls[idx + 2].nil?
      extra = @rolls[idx + 2]
    else
      extra = 0
    end
    @total += extra

  end

end
