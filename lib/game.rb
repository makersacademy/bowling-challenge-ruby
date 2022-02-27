class Game

    def initialize
      @total = 0
    end


  def score(game_result)
    game_result.each_with_index do |frame, idx|
      if strike?(frame)
        add_strike_bonus(game_result,idx)
      elsif spare?(frame)
        add_spare_bonus(game_result, idx)
      else
        @total += frame[0] + frame[1]
      end
    end
    @total
  end

  private

  def add_spare_bonus(game_result, idx)
    next_frame = game_result[idx + 1]
    @total += 10 + next_frame[0]
  end

  def add_strike_bonus(game_result, idx)
    next_frame = game_result[idx + 1]
    @total += 10 + next_frame[0] + next_frame[1]
  end

  def strike?(pins)
    pins[0] == 10
  end

  def spare?(pins)
    pins[0] + pins[1] == 10
  end

end
