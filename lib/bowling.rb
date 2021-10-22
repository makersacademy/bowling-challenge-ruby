class Bowling
  attr_reader :game_array, :round_array, :total_score, :round_counter, :first_bowl, :second_bowl
  def initialize()
    @game_array = []
    @round_array = []
    @round_counter = 1
    @first_bowl
    @second_bowl
  end

  def add_first_bowl(bowl)
    @first_bowl = bowl
  end

  def add_second_bowl(bowl)
    @second_bowl = bowl
  end

  def finish_round
    @round_array = [@first_bowl, @second_bowl]
    @game_array << @round_array
  end

  def calculate_total_score
    score = 0
    @game_array.each { |round| score += round.sum}
    score
  end

end