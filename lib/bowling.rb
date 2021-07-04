class BowlingScore
  attr_reader :current_score

  def initialize
    @current_score = 0
    @number_of_rolls = 0
  end

  def hit(number)
    @current_score += number
    @number_of_rolls += 1
  end

  def gutter
    @current_score += 0
    'Gutter ball!'
  end

  def spare
    if @current_score == 10
      'Spare!'
    end
  end

  def number_of_rolls
    @number_of_rolls
  end

end
