require_relative './frame'
class StandardFrame < Frame

  def initialize(frame_number)
    super(frame_number) 
  end
  

  def play 
    [:first,:second].each { |roll_sequence| record_roll(roll_sequence) unless strike? }
  end

  private

  def record_roll(roll_sequence)
    input = get_player_input(roll_sequence)
    roll_sequence == :first ? @first_roll_score = input : @second_roll_score = input
    @remaining_pins -= input
  end

  def get_player_input(roll_sequence)
    Player.enter_roll(pins: @remaining_pins,frame:  @frame_number, roll: roll_sequence)
  end

end