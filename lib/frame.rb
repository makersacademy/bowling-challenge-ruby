class Frame

  attr_reader :roll_1, :roll_2, :roll_3
  attr_accessor :score

  def initialize(turn)
    @roll_1 = nil
    @roll_2 = nil
    @roll_3 = nil
    @score = 0
    @turn = turn
    @complete = 'incomplete'
  end

  def roll(score)
    if @roll_1 == nil
      @roll_1 = score 
      calculate_total
      @complete = 'complete' if score == 10 && @turn < 10
    elsif @turn < 10 && @roll_2 == nil && !complete?
      @roll_2 = score
      calculate_total
      @complete = 'complete'
    elsif @turn == 10 && @roll_2 == nil && !complete?
      @roll_2 = score
      calculate_total
      @complete = 'complete' if @roll_1 + @roll_2 < 10
    elsif !complete? && @roll_1 + @roll_2 >= 10
      @roll_3 = score
      calculate_total
      @complete = 'complete'
    else
      raise "This frame is complete"
    end
  end

  def complete?
    @complete == 'complete'
  end

  def strike?
    @roll_1 == 10
  end

  def spare?
    @roll_1 != 10 && @roll_1.to_i + @roll_2.to_i == 10
  end

  def total
    @roll_1.to_i + @roll_2.to_i + @roll_3.to_i
  end

  def calculate_total
    @score = @roll_1.to_i + @roll_2.to_i + @roll_3.to_i
  end

end
