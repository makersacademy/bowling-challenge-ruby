class Bowling
  attr_reader :round_score, :total_score, :round, :ball, :strike_bonus, :spare_bonus, :bonus_ball, :bonus_score, :last_strike

  def initialize
    @round_score = 0
    @total_score = 0
    @round = 1 
    @ball = 1
    @strike_bonus = nil
    @spare_bonus = nil
    @bonus_ball = 1
    @bonus_score = 0
    @last_strike = nil
  end

  def score_input
    input = $stdin.gets
    scorer(input.to_i)
  end

  def input_score_message
    "Please enter your score for round #{round}, ball #{ball}"
  end

  def scorer(pins)
    @strike_bonus = nil if @round > 11
    @spare_bonus = nil if @round > 11

    strike_calculator(pins)
    spare_calculator(pins)

    if @round >= 10
      @total_score += pins
      next_round
    else

      @round_score += pins

      if strike
        @strike_bonus = true
        @last_strike = true
        add_to_total_score
        next_round
      elsif spare
        @spare_bonus = true
        add_to_total_score
        next_round
        @last_strike = false
      elsif ball_one
        @ball += 1
        @last_strike = false
      elsif ball_two
        add_to_total_score
        next_round
        @last_strike = false
      end
    end
  end

  private 

  def strike
    @round_score == 10 && ball == 1
  end

  def spare
    @round_score == 10 && ball == 2
  end

  def ball_one
    @round_score < 10 && ball == 1
  end

  def ball_two 
    @round_score < 10 && ball == 2
  end

  def next_round 
    @round_score = 0
    @ball = 1 
    @round += 1
  end

  def add_to_total_score
    @total_score += @round_score
  end

  def spare_calculator(pins)
    if @spare_bonus
      @bonus_score += pins
      @total_score += @bonus_score
      @bonus_score = 0
      @spare_bonus = false 
    end
  end

  def strike_calculator(pins)
    if @strike_bonus && @bonus_ball == 2 && @last_strike
      if pins == 10 && @round < 12
        @bonus_score += (pins * 2) 
      else 
        @bonus_score += pins
        @bonus_ball = 1
        @strike_bonus = false
      end
      @total_score += @bonus_score
      @bonus_score = 0

    elsif @strike_bonus && @bonus_ball == 2
      @bonus_score += pins
      @total_score += @bonus_score
      @bonus_score = 0
      @strike_bonus = false
      @bonus_ball = 1

    elsif @strike_bonus && @bonus_ball == 1
      unless pins == 10 && round < 12 && @last_strike
        @bonus_score += pins
      end
      @bonus_ball += 1
    end 
  end 
end 