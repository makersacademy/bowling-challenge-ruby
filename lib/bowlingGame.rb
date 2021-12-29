class BowlingGame
  attr_reader :roll_list
  def initialize(roll_list = [])
    @roll_list = roll_list
  end

  def roll(num)
    @roll_list.push(num)
  end

  def outcome
    @roll_list.inject(0, :+)
  end
end