class Scorecard
  def initialize(frames)
    @frames = frames
  end

  def run
    if valid_input? == false
      puts "Check the rolls you entered. Rules are:\n  Exactly 10 frames\n  Each roll between 0 - 10\n  Each frame must add up to less than 10 (except for 10th frame where max sum is 30)\n  2 rolls per frame (unless it's a strike or it's the tenth frame bonus roll)"
    else
      totals_script
    end
  end

  def totals_script
    frame = 1
    while frame <= 10
      puts "Frame #{frame} - Pins Knocked: #{@frames[frame - 1]}.\n TOTAL SCORE: #{running_total(frame)}"
      frame += 1
    end
  end

  def current_frame_score(frame_number)
    current_frame = @frames[frame_number - 1]
    next_frame = @frames[frame_number]
    subsequent_frame = @frames[frame_number + 1]

    # call on separate function if it's the ninth frame (because of its unique scoring interactions with the tenth frame)
    if frame_number == 9
      return ninth_frame_score

      # if it's the tenth frame, score is the sum of all rolls in the frame
    elsif frame_number == 10
      return current_frame.sum

      # if curent frame is a strike and the next frame isn't a strike, score is 10 + sum of next frame
    elsif current_frame[0] == 10 && next_frame.length == 2
      return 10 + next_frame.sum

      # if current frame and next frame are strikes, score is 20 + first roll of the subsequent frame
    elsif current_frame[0] == 10 && next_frame.length == 1
      return 20 + subsequent_frame[0]

      # if current frame is a spare, score is 10 + first roll of next frame
    elsif current_frame.sum == 10
      return 10 + next_frame[0]

      # if frame isn't a spare or a strike, score is the sum of each roll in the frame
    else
      return current_frame.sum
    end
  end

  # add up all the single frame scores up to the specified frame number
  def running_total(frame_number)
    frame = 1
    total = 0
    while frame <= frame_number
      total += current_frame_score(frame)
      frame += 1
    end
    return total
  end

  def ninth_frame_score
    ninth_frame = @frames[8]
    tenth_frame = @frames[9]

    if ninth_frame[0] == 10
      return 10 + tenth_frame[0] + tenth_frame[1]
    elsif ninth_frame.sum == 10
      return 10 + tenth_frame[0]
    else
      return ninth_frame.sum
    end
  end

  def valid_input?
    if @frames.length != 10
      false
    elsif invalid_roll_number?
      false
    elsif invalid_frame_sum?
      false
    elsif invalid_roll_count?
      false
    else
      true
    end
    # check that array length is 10, no negative numbers, the sum of each subarray less than ten (except tenth frame which is max 30) / each element of each subarray has to be
    # between 0 and 10 as well as the sum being less than 10. Max 2 rolls per frame (apart from the 10th). If frame has one roll the score has to be 10.
  end

  private

  def invalid_roll_number?
    state = false
    @frames.each do |frame|
      frame.each do |roll|
        if roll < 0 || roll > 10
          state = true
        end
      end
    end
    return state
  end

  def invalid_frame_sum?
    state = false
    @frames.each_with_index do |frame, index|
      if index == 9 && frame.sum > 30
        state = true
      elsif index != 9 && frame.sum > 10
        state = true
      end
    end
    return state
  end

  def invalid_roll_count?
    state = false
    @frames.each_with_index do |frame, index|
      if (index == 9 && frame.length < 2) || (index == 9 && frame.length > 3)
        state = true
      elsif index != 9 && frame.length == 1 && frame[0] != 10
        state = true
      elsif index != 9 && frame.length > 2
        state = true
      end
    end
    return state
  end
end

# frames = [[10], [3, 4], [5, 5], [5, 5], [10], [8, 1], [10], [10], [3, 7], [10, 2, 8]]
# scorecard = Scorecard.new(frames)
# scorecard.run
