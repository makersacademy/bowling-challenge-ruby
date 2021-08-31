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
    # Needs to be refactored, unsure how.
    until current_frame == rounds.length
      calculate_all_scenarios(current_frame, arr)
      current_frame += 1
    end
    @score += arr.flatten.sum
  end

  private

  def calculate_all_scenarios(which_frame, arr)
    if strike?(round(which_frame))
      calculate_strike(which_frame, arr)
    elsif spare?(round(which_frame))
      calculate_spare(which_frame, arr)
    else
      arr << round(which_frame)
    end
  end

  def calculate_strike(which_frame, arr)
    arr << round(which_frame) if which_frame == 9
    arr << [round(which_frame), round(which_frame + 1)[0..1]] if which_frame == 8
    arr << [round(which_frame), round(which_frame + 1)[0], round(which_frame + 2)[0]] if which_frame < 8
  end

  def calculate_spare(which_frame, arr)
    arr << round(which_frame) if which_frame == 9
    arr << [round(which_frame), round(which_frame + 1)[0]] if which_frame < 9
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
