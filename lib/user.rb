
class User
  attr_reader :name

  def initialize(name, scorecard = Scorecard.new)
    @name = name
    @scorecard = scorecard
  end

  def add_score(score)
    @scorecard.add_score(score)
  end
  
end