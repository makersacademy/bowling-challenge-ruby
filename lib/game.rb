class Game
  attr_reader :rolls

  MAX_PINS = 10

  def initialize
    @rolls = [] 
    @max_rolls = 20
  end

  def roll(pins) 
    raise ("This is not valid input.") if pins > MAX_PINS
    raise ("Game Over. Ask for your score!") if completed_all_rolls
    @rolls << pins
      if @rolls.count == 19 && (pins == 10) || @rolls.count == 20 && (@rolls[-1] + @rolls[-2]) == 10
        @max_rolls += 1
      elsif first_bowl? && (pins == 10)
        @rolls << "-" unless completed_all_rolls
      end
  end

  def completed_all_rolls
    @rolls.count == @max_rolls
  end

  def total_score
    pins_score + total_bonus_points
  end
  
  private

  def pins_score 
    @scores = @rolls - ["-"]
    @scores.inject(0, :+)
  end

  def total_bonus_points
    spare_score + strike_score
  end

  def first_bowl?
    @rolls.length % 2 == 1
  end

  def spare_score
    sum = 0
    zero_pad
    frames.each_with_index do |frame, i|
      unless frame.include?("-") 
        if frame.inject(0, :+) == 10 
          i += 1
          sum += frames[i][0] 
        end
      end
    end
    sum
  end

  def zero_pad
    2.times { @rolls << 0 }
  end

  def frames 
    @rolls.each_slice(2).to_a 
  end
  
  def strike_score
    sum = 0
    zero_pad
    frames.each_with_index do |frame, i| 
      if frame.include?("-") 
        i += 1
        first_bowl = frames[i][0]
        second_bowl = frames[i][1]
        if second_bowl == "-" || second_bowl = 10
          sum += first_bowl
          i += 1
          sum += first_bowl
        end
      end
    end
    sum 
  end  
end
