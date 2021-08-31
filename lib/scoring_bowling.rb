class ScoringBowling
  MAX_FRAMES = 10
  MAX_PINS = 10
  attr_reader :rounds, :frame, :score

  def initialize
    @rounds = []
    @frame = 0
    @score = 0
  end

  def add_bowl(*bowls)
    raise 'Game Over, no more scores can be added' if @rounds.length == MAX_FRAMES
    
    @rounds << { frame: frame_count, bowls: [*bowls] }
  end
  
  def calculate_score
    current_frame = 0
    arr = []
    until current_frame == rounds.length
      calculate_all_scenarios(current_frame, arr)
      current_frame += 1
    end
    @score += arr.flatten.sum
  end

  private

  def calculate_all_scenarios(which_frame, chosen_arr)
    if strike?(round(which_frame))
      calculate_strike(which_frame, chosen_arr)
    elsif spare?(round(which_frame))
      calculate_spare(which_frame, chosen_arr)
    else
      chosen_arr << round(which_frame)
    end
  end

  def calculate_strike(chosen_frame, chosen_arr)
    chosen_arr << choose_scenario(1, chosen_frame ) if chosen_frame == 9
    chosen_arr << choose_scenario(2, chosen_frame, 1) if chosen_frame == 8
    chosen_arr << choose_scenario(3, chosen_frame) if chosen_frame < 8
  end

  def calculate_spare(chosen_frame, chosen_arr)
    chosen_arr << choose_scenario(1, chosen_frame) if chosen_frame == 9
    chosen_arr << choose_scenario(2, chosen_frame, 0) if chosen_frame < 9
  end

  def choose_scenario(input, chosen_frame, *index)
    case input
      when 1
        round(chosen_frame)
      when 2
        [round(chosen_frame), round(chosen_frame + 1)[0..index.pop]]
      when 3
        [round(chosen_frame), round(chosen_frame + 1)[0], round(chosen_frame + 2)[0]]
    end
  end

  def round(which_frame)
    @rounds[which_frame][:bowls]
  end

  def strike?(bowls)
    bowls.first == MAX_PINS
  end

  def spare?(bowls)
    bowls[0..1].sum == MAX_PINS
  end

  def frame_count
    @frame += 1
  end
end
