class Player
  attr_reader :name, :score, :points, :bonus, :total, :frame_number

  def initialize(name:)
    @name = name
    @score = []
    @bonus = 0 
    @points = 0 
    @total = 0
    @frame_number = 0
  end

  def add_score(roll_1:, roll_2: 0, total:)
    @score << {roll_1: roll_1, roll_2: roll_2, total: total}
    @frame_number += 1
    
  end

  def calculate
    calculate_bonus() 
    calculate_points()
    calculate_total()
  end

end