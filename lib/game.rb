class Game 
  attr_reader :scores

  def initialize(player)
    @scores = []
  end

  def score(num)
    check_input(num)
    @scores << num
  end
  
  def last_score
    @scores.last
  end
    
  private

  def check_input(num)
    raise 'can only accept scores 1-10' unless num.positive? && num <= 10
  end
end
