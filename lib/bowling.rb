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
    @round_array << @first_bowl
    finish_round if @first_bowl == 10
  end

  def add_second_bowl(bowl)
    @second_bowl = bowl
    @round_array << @second_bowl
    finish_round
  end

  def finish_round
    @game_array << @round_array
    @first_bowl = nil
    @second_bowl = nil
    @round_array = []
    @round_counter += 1
  end

  def calculate_round_score(round)
    round_index = round - 1
    return "Incomplete" if game_array.length < round
    if strike?(round)
      return "Incomplete" if game_array.length < round + 1
      game_array[round_index].sum + game_array[round].sum
    end
    if spare?(round)
      if game_array.length >= round + 1
        return game_array[round_index].sum + game_array[round][0]
      elsif !@first_bowl.nil?
        return game_array[round_index].sum + @first_bowl
      else
        return "Incomplete"
      end
    end
    game_array[round_index].sum
  end

  def calculate_total_score
    score = 0
    @game_array.each do |round|
       score += round.sum
    end
    score
  end

  def strike?(round)
    round_index = round - 1
    return false unless game_array[round_index].length == 1
    return false unless game_array[round_index].sum == 10
    true
  end

  def spare?(round)
    round_index = round - 1
    return false if strike?(round)
    return false unless game_array[round_index].sum == 10
    true
  end

end