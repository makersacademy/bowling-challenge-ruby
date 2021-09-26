require_relative './frame'
class LastFrame < Frame

  def initialize(frame_number)
    super(frame_number) 
    @third_roll_score = 0
  end

  attr_reader :third_roll_score

  def second_strike?
    @second_roll_score == 10
  end

  def play 
    handle_first_roll
  end

  private

  def handle_first_roll
    @first_roll_score = get_player_input(:first)
    @remaining_pins = 10 if strike?
    handle_second_roll
  end

  def handle_second_roll
    @second_roll_score = get_player_input(:second)
    if strike? || spare?
      @remaining_pins = 10 
      handle_third_roll
    else
      return
    end
  end

  def handle_third_roll
    @third_roll_score = get_player_input(:third)
  end

  def get_player_input(roll_sequence)
    Player.enter_roll(pins: @remaining_pins,frame: @frame_number, roll: roll_sequence)
  end

end