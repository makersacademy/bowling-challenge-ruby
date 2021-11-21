class Scorecard
  attr_reader :frame_scores, :scorecard, :total_scores, :frame_index

  def initialize()
    @frame_scores = []
    @scorecard = []
    @total_scores = 0
    @frame_index = -1
  end

  def roll(first_roll, second_roll = 0)
    @frame_index += 1
    @scorecard << [first_roll, second_roll]
    @frame_scores << first_roll + second_roll
  end

  def scores
    strike_bonus if strike?
    @total_scores += @frame_scores.reduce(:+)
  end

  def strike?
    @scorecard[@frame_index - 1][0] == 10 ? true : false
  end

  def strike_bonus 
    @frame_scores[@frame_index - 1] += @frame_scores[@frame_index] 
  end

end

a = Scorecard.new
a.roll(2,5)
a.roll(10)
a.roll(4,8)
p a.scores
p a


