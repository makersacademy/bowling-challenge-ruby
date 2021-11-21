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
end

a = Scorecard.new
a.roll(2,5)
a.roll(10)
# a.roll(4,8)
p a