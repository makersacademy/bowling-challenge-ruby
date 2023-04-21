class BowlingScorer
  def initialize
    @player_score = 0
    @frames = []
  end

  def add_frame(shot1, shot2)
    fail "Looks like you hit the next lane or something, cant knock more than 10" if shot1 + shot2 > 10
    fail "Smells like invalid input" if shot1 < 0 || shot2 < 0
    ## Line below is irrelevant for the current specs, but this is done assuming when UI is developed
    ## the user will input their shots sequentially as opposed to passing them in together
    shot1 == 10 ? current_frame = [10,0] : current_frame = [shot1, shot2]
    @frames << current_frame
    return current_frame
  end

  def check_for_specials(frame)
    message = ""
    if frame[0] == 10
      message = "strike"
    elsif frame.sum == 10
      message = "spare"
    elsif frame.sum == 0
      message = "gutter"
    else
      message = "normal"
    end
    return message
  end

  def add_bonus_frame(*args)
    @frames << [*args]
    return [*args]
  end

  def count_player_bonus_scores
    fail "Player has not scored any bonuses!" if @frames.length <= 10
    @player_score += @frames[-1].flatten.sum
  end

  def count_frame_score(index)
    current_frame = @frames[index]
    previous_frame = @frames[index-1]
    frame_score = current_frame.flatten.sum
    if check_for_specials(previous_frame) == "spare"
      frame_score += current_frame[0]
    elsif check_for_specials(previous_frame) == "strike"
      frame_score += current_frame.sum
    end
    return frame_score
  end

  def count_player_score
    i = 1
    @player_score += @frames[0].sum
    frames = [@frames.length, 10].min
    while i < frames
      @player_score += count_frame_score(i)
      i += 1
    end
    count_player_bonus_scores if @frames.length > 10
    return @player_score
  end

  ## Helper methods - Used in testing and not relevant to gameplay ##
  def frames
    @frames
  end

  def reset_scores_and_frames
    @player_score = 0
    @frames = []
  end
end