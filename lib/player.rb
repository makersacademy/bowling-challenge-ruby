class Player
  attr_reader :name, :score, :points, :bonus, :total, :frame_number

  def initialize(name:)
    @name = name
    @score = []
    @bonus = 0 #strictly the additional points fro mstrikes/spares. Not pin points
    @points = 0 #strictly the number of pins knocked over. no bonuses
    @total = 0
    @frame_number = 0
  end

  def add_score(roll_1:, roll_2: 0, total:)
   @score << {roll_1: roll_1, roll_2: roll_2, total: total}
   @frame_number += 1
   calculate()
  end

  def calculate
    calculate_bonus()
    calculate_points()
    calculate_total()
  end

 private

  def calculate_bonus
    ind = 0
    @bonus = 0 #this is to assure the calculation of bonus can be performed many times
    ((@score.size)-1).times do
      @bonus += (@score[ind + 1][:total]) if @score[ind][:roll_1] == 10
      @bonus += @score[ind + 1][:roll_1] if (@score[ind][:roll_1] + @score[ind][:roll_2]) == 10 && @score[ind][:roll_1] != 10
      ind += 1
    end

  end

  def calculate_points
    ind = 0
    @points = 0 #this is to assure the calculation of points can be performed many times
    ((@score.size)).times do
      # so that the bonus balls or a 10th frame strike/spare are not counted
      @points += @score[ind][:total] if ind != 10
      ind += 1
    end
  end

  def calculate_total
    @total = @points + @bonus
  end

end
