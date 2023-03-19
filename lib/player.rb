class Player
  def initialize(name)
    @name = name
    @score = 0
  end

  def roll(x)
    return x
  end

  def final_score
    return @score
  end

  def add_to_score(x)
    @score += x
  end

  def name
    return @name
  end
end