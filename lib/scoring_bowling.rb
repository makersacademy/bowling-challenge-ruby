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
    # Needs to be refactored, unsure how
    until current_frame == rounds.length
      if strike?(round(current_frame))
        arr << round(current_frame) if current_frame == 9
        arr << [round(current_frame), round(current_frame + 1)[0..1]] if current_frame == 8
        arr << [round(current_frame), round(current_frame + 1)[0], round(current_frame + 2)[0]] if current_frame < 8
      elsif spare?(round(current_frame))
        arr << round(current_frame) if current_frame == 9
        arr << [round(current_frame), round(current_frame + 1)[0]] if current_frame < 9
      else
        arr << round(current_frame)
      end
      current_frame += 1
    end
    @score += arr.flatten.sum
  end

  private

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
