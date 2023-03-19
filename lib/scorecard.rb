class ScoreCard
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
      #--------------------------------------------
    end
  end

  private

  # ---------------------------------
  # GAME SETUPS
  # ---------------------------------

  # POPULATE @SCORE_CARD WITH STARTER HASHES

  def _create_frames
    return unless @score_card.nil? # prevent reset scorecard when method is called again

    @score_card = []
    (0..9).each do |index| 
      @score_card[index] = {number: nil, status: "", rolls: [], bonus: []}
    end

    return @score_card
  end

  # USER INPUT METHODS 

  def _get_user_input(frame, roll)
    while true
      input = @io.gets.chomp.to_i
      return input if roll == 1 && input.between?(0, 10)
      return input if roll == 2 && input <= (10 - frame[:rolls][0])
    end
  end

  # ---------------------------------
  # GAME MAIN LOGIC
  # ---------------------------------

  def _game_setup(frame, index)
    @frame_number = index + 1 
    frame[:number] = @frame_number
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
    can_accept_bonuses =  frame[:bonus].length < 2
    can_accept_bonus = frame[:bonus].length < 1

    frame[:bonus] << bonus if is_a_strike and can_accept_bonuses
    frame[:bonus] << bonus if is_a_spare and can_accept_bonus
  end

  # STRIKE OR SPARE STATUS ASSIGNMENT

  def _assign_status_to(frame, status)
    frame[:status] = status
  end

  def _frame_is_a_spare(frame)
    has_rolled_twice = frame[:rolls].length == 2
    total_points_10 = frame[:rolls].sum == 10
    return true if has_rolled_twice && total_points_10 
  end # 'true if' is not necessary here but it gives more sence to the sentence
end
