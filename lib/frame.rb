class Frame

  # total_score is a class variable that holds the game's total score
  @@total_score = 0
  @@spare_status = false

  attr_reader :scores, :state, :spare_status, :total_score, :current_roll

  def initialize(id, state = false, current_roll = 1)
    @id = id
    @scores = {
        first_roll: 0,
        second_roll: 0
    }
    @state = state
    @current_roll = current_roll
  end

  def first_roll(pins)
    return strike if is_strike?(pins)

    increment_score(:first_roll, pins)
    @current_roll = 2
  end

  def second_roll(pins)
    @@spare_status = true if is_spare?(pins)
    increment_score(:second_roll, pins)
  end

  def strike
    increment_score("first_roll", 10)
    terminate_frame
  end

  private

  def terminate_frame
    update_total_score
    @state = true
  end

  def increment_score(roll, points)
    @scores[roll.to_sym] += points
  end

  def update_total_score
    @@total_score += @scores[:first_roll] + @scores[:second_roll]
  end

  def is_spare?(pins)
    pins == 10 - @scores[:first_roll]
  end

  def is_strike?(pins)
    pins == 10
  end

end