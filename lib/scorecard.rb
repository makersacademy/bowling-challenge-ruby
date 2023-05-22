class Scorecard 
  def initialize
    @scores = []
  end

  def scores
    @scores
  end

  def add_frame(pins_down)
    calculate_bonus(pins_down) unless @scores.empty? || @scores.last[:rolls].sum != 10

    return @scores << { rolls: pins_down } if pins_down.sum == 10
  
    # Not a spare or strike
    total = @scores.empty? ? pins_down.sum : @scores.last[:score] + pins_down.sum
    @scores << { rolls: pins_down, score: total }
  end

  def add_final_frame(pins_down)
    
    if @scores[-2][:rolls].include?(10)
      get_prev = @scores[-3][:score]
      @scores[-2][:score] = get_prev + 20 + pins_down[0]
    end
    
    if @scores[-1][:rolls].include?(10)
      add_strike_bonus(pins_down.slice(0, 2))
    elsif @scores[-1][:rolls].sum == 10
      add_spare_bonus(pins_down[0])
    end
   
    total = @scores.last[:score] + pins_down.sum
    @scores << { rolls: pins_down, score: total }
  end

  private

  def calculate_bonus(pins_down)
    # last roll was spare
    if !@scores.last[:rolls].include?(10)
      add_spare_bonus(pins_down[0])
    else
      # last roll was strike
        # check if previous was also strike
        if @scores[-2] && @scores[-2][:rolls].include?(10)
          get_prev = @scores[-3] ? @scores[-3][:score] : 0
          @scores[-2][:score] = get_prev + 20 + pins_down[0]
        end

        add_strike_bonus(pins_down) if !pins_down.include?(10)      
    end   
  end

  def add_spare_bonus(bonus_1)
    @scores.last[:score] = previous_score + 10 + bonus_1
  end

  def add_strike_bonus(bonus_2)
    @scores.last[:score] = previous_score + 10 + bonus_2.sum
  end
  
  def previous_score
    return @scores[-2] ? @scores[-2][:score] : 0
  end
end