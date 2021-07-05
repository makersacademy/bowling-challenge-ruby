require_relative "rules"

class ScoreCard

  include Rules

  attr_reader :frame, :rolls, :pins_knocked, :total_score, :pins_per_frame, :bonus_roll, :first_throw, :second_throw, :previous_turn_bonus

  ### Initializes with starting frame at 1 and score beginning at zero. 

def initialize
  @frame = 1
  @first_throw = 0
  @second_throw = 0
  @bonus_roll = 1
  @pins_per_frame = []
  @total_score = 0
  @previous_turn_bonus = []
end

def bonus_roll?
  frame == 10 && first_throw == strike?
end

def user_input
  loop do
      puts "Please enter your first throw"
    @first_throw = STDIN.gets.chomp.to_i
    break if strike? && single_turn_valid(first_throw)
      puts "Please enter your second throw"
    @second_throw = STDIN.gets.chomp.to_i
    break if both_turns_valid && single_turn_valid(second_throw)
      puts "Re-enter your results. Something wasn't quite right there."
    end
    pins_per_frame << [@first_throw, @second_throw]
end

  def score_entry(first_throw, second_throw)
    puts "Current Frame is #{@frame}"
    @total_score += score_strike(first_throw, second_throw) if strike_last_turn?
    @total_score += score_spare(first_throw, second_throw) if spare_last_turn?
    @total_score += score_hit(first_throw, second_throw) if !strike_last_turn? && !spare_last_turn? && pins_hit? && !gutter?
    gutter_text if gutter?
    change_frame
    set_turn_bonus(first_throw, second_throw)
  end

  def set_turn_bonus(first_throw, second_throw)
    if first_throw == 10
      @previous_turn_bonus << "strike"
    elsif first_throw + second_throw == 10
      @previous_turn_bonus << "spare"
    else 
      @previous_turn_bonus << false
    end
  end


  def score_strike(first_throw, second_throw)
    if @previous_turn_bonus == ["strike", "strike"]
      pins_per_frame[-1] + [first_throw + second_throw] * 2
      (first_throw + second_throw) * 2
    else
      pins_per_frame << [first_throw, second_throw]
      (first_throw + second_throw)
    end
  end

  def pins_per_frame
    @pins_per_frame
  end

  def score_spare(first_throw, second_throw)
    pins_per_frame[-1][0] += first_throw * 2
    pins_per_frame << [first_throw, second_throw]
    (first_throw + second_throw) *2
  end

  def score_hit(first_throw, second_throw)
    # pins_per_frame << [first_throw, second_throw]
    first_throw + second_throw
  end


  private 

  def strike_last_turn?
    @previous_turn_bonus.last == "strike"
  end

  def spare_last_turn?
    @previous_turn_bonus.last == "spare"
  end

  def change_frame
    @frame += 1
  end

  def gutter_text
    puts "Gutter ball, no points"
  end

  def end_game
    "Game over final score is"
  end
end


# scorecard = ScoreCard.new

# 4.times do |test|

# scorecard.user_input
# scorecard.score_entry(scorecard.first_throw, scorecard.second_throw)
# puts "Points = #{scorecard.total_score}"
# end


