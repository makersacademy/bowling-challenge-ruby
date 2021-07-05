class BowlingScore
  attr_reader :current_score

  def initialize
    @number_of_rolls = 0
    @current_score = 0
  end

  def hit(number)
    @number_of_rolls += 1
    @current_score += number
      if @current_score == 10
        spare
      end
  end

  def gutter
    @current_score += 0
    'Gutter ball!'
  end

  def spare
    'Spare!'
  end

  def number_of_rolls
    @number_of_rolls
  end

end
