require_relative 'frame'

class ScoreCard
  def update_pending_bonuses(frames, current_frame)
    update_pending_strikes(frames, current_frame)
    update_pending_spares(frames, current_frame)
  end

  private

  def update_pending_strikes(frames, current_frame)
    previous_frame = current_frame - 1
    frame_before_last = current_frame - 2

    return if previous_frame == 0
    if (frames[current_frame].two_balls?) && (frames[previous_frame].strike?) && (frames[previous_frame].bonus_score == 0)
      frames[previous_frame].update_bonus_score(frames[current_frame].frame_score)
    end
    
    return if frame_before_last == 0
    if (frames[current_frame].strike?) && (frames[previous_frame].strike?) && (frames[frame_before_last].strike?) && (frames[frame_before_last].bonus_score == 0)
      frames[frame_before_last].update_bonus_score(20)
    end
    
    return if frame_before_last == 0
    if (frames[current_frame].get_ball_score(1) > 0) && (frames[previous_frame].strike?) && (frames[frame_before_last].strike?) && (frames[frame_before_last].bonus_score == 0)
      frames[frame_before_last].update_bonus_score(10 + frames[current_frame].frame_score)
    end
  end

  def update_pending_spares(frames, current_frame)
    previous_frame = current_frame - 1
    return if previous_frame == 0

    if (frames[previous_frame].spare?)
      frames[previous_frame].update_bonus_score(frames[current_frame].get_ball_score(1))
    end
  end
end
