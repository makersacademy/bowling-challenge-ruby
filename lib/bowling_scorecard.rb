class BowlingScoreCard
  attr_accessor :score_card

  def initialize(io = Kernel)
    @io = io
    @score_card = _create_frames
  end

  def run
    @score_card.each_with_index do |frame, index|
      _game_setup(frame, index)

      @rolls.each do |roll|
        input = _get_user_input(frame, roll)
        if roll == 1 && input == 10
          _strike_game_logic(frame, index, input)
          break
        else
          _non_strike_game_logic(frame, index, input)
        end
      end
      _check_if_extra_rolls(frame) if @frame_number == 10
    end
  end

  private

  # ----------------------------------
  # GAME SETUPS AND USER INTERACTIONS
  # ----------------------------------

  def _create_frames 
    return unless @score_card.nil? # prevent scorecard reset when method is called again

    @score_card = []
    (0..9).each do |index| 
      @score_card[index] = { frame: nil, status: "", rolls: [], bonus: [] }
    end
    return @score_card
  end

  def _get_user_input(frame, roll)
    while true
      input = @io.gets.chomp.to_i
      return input if roll == 1 && input.between?(0, 10)
      return input if roll == 2 && input <= (10 - frame[:rolls][0])
    end
  end

  def _get_input_for_bonus_rolls
    while true
    input = @io.gets.chomp.to_i
    return input if input.between?(0, 10)
    end
  end

  # ---------------------------------
  # GAME MAIN LOGIC
  # ---------------------------------

  def _game_setup(hash, index)
    @frame_number = index + 1 
    hash[:frame] = @frame_number
    @rolls = [1, 2]
  end

  def _strike_game_logic(frame, index, input)
    _update_score_board(frame, index, input)
    _assign_status_to(frame, "STRIKE")
  end

  def _non_strike_game_logic(frame, index, input)
    _update_score_board(frame, index, input)
    _assign_status_to(frame, "SPARE") if _frame_is_a_spare(frame)
  end

  def _assign_status_to(frame, status)
    frame[:status] = status
  end

  def _frame_is_a_spare(frame)
    has_rolled_twice = frame[:rolls].length == 2
    total_points_10 = frame[:rolls].sum == 10
    return true if has_rolled_twice && total_points_10 
  end # 'true if' is not necessary here but it gives more sence to the sentence

  def _update_score_board(frame, index, input)
    _add_score_to(frame[:rolls], input)
    _populate_bonus(@score_card[index - 2], input)
    _populate_bonus(@score_card[index - 1], input)
  end

  def _add_score_to(frame, input)
    frame << input
  end

  def _populate_bonus(frame, bonus)
    is_a_strike = frame[:status] == "STRIKE"
    is_a_spare = frame[:status] == "SPARE"
    can_accept_bonuses = frame[:bonus].length < 2
    can_accept_bonus = frame[:bonus].length < 1

    frame[:bonus] << bonus if is_a_strike and can_accept_bonuses
    frame[:bonus] << bonus if is_a_spare and can_accept_bonus
  end

  # ---------------------
  # EXTRA ROLLS MECHANIC
  # ---------------------

  def _check_if_extra_rolls(frame)
    _give_2_extra_rolls(frame) if frame[:status] == "STRIKE"
    _give_1_extra_roll(frame) if frame[:status] == "SPARE"
  end

  def _give_2_extra_rolls(frame)
    @rolls.each do |bonus_roll|
      input = _get_input_for_bonus_rolls
      _populate_bonus(@score_card[8], input) if bonus_roll == 1
      _add_score_to(frame[:bonus], input)
    end 
  end

  def _give_1_extra_roll(frame)
    bonus_roll = _get_input_for_bonus_rolls
    _add_score_to(frame[:bonus], bonus_roll)
  end
end

if __FILE__ == $0
  new_game = BowlingScoreCard.new
  new_game.run
end

new_game.score_card.each { |frame| puts frame } 