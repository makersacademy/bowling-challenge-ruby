class ScoreCard
  def update_pending_bonuses(frames, current_frame)
    update_pending_strikes(frames, current_frame)
    update_pending_spares(frames, current_frame)
  end

  private

  def update_pending_strikes(frames, current_frame)
    previous_frame = current_frame - 1
    frame_before_last = current_frame -2

    if (frames[current_frame].two_bowls?) && (frames[previous_frame].strike?)
      frames[previous_frame].update_bonus_score(frames[current_frame].score)
    elsif (frames[current_frame].strike?) && (frames[previous_frame].strike?) && (frames[frame_before_last].strike?)
      frames[frame_before_last].update_bonus_score(20)
    end
  end

  def update_pending_spares(frames, current_frame)
    previous_frame = current_frame - 1

    if (frames[previous_frame].spare?)
      frames[previous_frame].update_bonus_score(frames[current_frame].score)
    end
  end

end