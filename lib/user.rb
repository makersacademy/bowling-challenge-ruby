class User
  
  def initialize(name, scorecard = Scoresheet.new)
    @name = name
    @scoresheet = scoresheet
  end
  
  def add_score(score)
    @scoresheet.add_score(score)
  end

  attr_reader :name, :scoresheet
  
end