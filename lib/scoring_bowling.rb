class Scoring_Bowling

  attr_reader :bowls, :frame

  def initialize
    @bowls = []
    @frame = 0
  end

  def add_bowl(first_bowl, second_bowl)
    @bowls << {frame: 1, bowls: [first_bowl, second_bowl]}
  end

end
