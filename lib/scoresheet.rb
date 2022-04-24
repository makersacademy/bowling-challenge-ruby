require_relative './frame'

class Scoresheet
  LAST_FRAME = 10

  def initialize(frame = Frame.new)
    @frames = []
    @current_frame = frame
  end

  def current_frame
    if last_frame
      final_frame
    elsif end_of_frame
      @frames << @current_frame
      new_frame unless complete?
    end
    @current_frame
  end

  def frame_score(num)
    score = 0
    score += bonus(num - 1)
    score += @frames[num - 1].first_roll
    score += @frames[num - 1].second_roll if @frames[num - 1].strike? == false
    score
  end

  def complete?
    @frames.length == 10
  end

  def total_score
    current_frame
    raise 'Your game has not finished yet!' unless complete?

    score = 0
    frames = (1..10).to_a
    frames.each do |frame|
      score += frame_score(frame)
    end
    # scoresheet
    score
  end

  private

  def new_frame(frame = Frame.new)
    @current_frame = frame
  end

  def end_of_frame
    @current_frame.rolls == 2 || @current_frame.strike?
  end

  def last_frame
    @frames.length == LAST_FRAME - 1
  end

  def bonus(num)
    bonus = 0
    bonus += strike_bonus(num) if @frames[num].strike?
    bonus += spare_bonus(num) if @frames[num].spare?
    bonus
  end

  def strike_bonus(num)
    if num == LAST_FRAME - 1
      @frames[-1].second_roll + @frames[-1].bonus_roll
    elsif num == LAST_FRAME - 2 && @frames[-1].strike?
      @frames[-1].first_roll + @frames[-1].second_roll
    elsif @frames[num + 1].strike?
      @frames[num + 1].first_roll + @frames[num + 2].first_roll
    else
      @frames[num + 1].first_roll + @frames[num + 1].second_roll
    end
  end

  def spare_bonus(num)
    if num == LAST_FRAME - 1
      @frames[-1].bonus_roll
    else
      @frames[num + 1].first_roll
    end
  end

  def final_frame
    if @current_frame.strike? || @current_frame.spare?
      @frames << @current_frame if @current_frame.rolls == 3
    elsif @current_frame.rolls == 2
      @frames << @current_frame
    end
  end

  # def scoresheet
  #   scoresheet_array = [
  #     '_____________________________________________________________',
  #     '|__1__|__2__|__3__|__4__|__5__|__6__|__7__|__8__|__9__|__10__|',
  #     '|   |_|   |_|   |_|   |_|   |_|   |_|   |_|   |_|   |_|  |_|_|',
  #     '|     |     |     |     |     |     |     |     |     |      |',
  #     '|_____|_____|_____|_____|_____|_____|_____|_____|_____|______|'
  #   ]

  #   frames = (0..8).to_a
  #   frames.each do |frame|
  #     if @frames[frame].strike? == false && @frames[frame].spare? == false
  #       scoresheet_array[2].slice!(3 + (6 * frame))
  #       scoresheet_array[2].insert(3 + (6 * frame), "#{@frames[frame].first_roll}")
  #       scoresheet_array[2].slice!(5 + (6 * frame))
  #       scoresheet_array[2].insert(5 + (6 * frame), "#{@frames[frame].second_roll}")
  #     elsif @frames[frame].spare?
  #       scoresheet_array[2].slice!(3 + (6 * frame))
  #       scoresheet_array[2].insert(3 + (6 * frame), "#{@frames[frame].first_roll}")
  #       scoresheet_array[2].slice!(5 + (6 * frame))
  #       scoresheet_array[2].insert(5 + (6 * frame), "/")
  #     elsif @frames[frame].strike?
  #       scoresheet_array[2].slice!(5 + (6 * frame))
  #       scoresheet_array[2].insert(5 + (6 * frame), "X")
  #     end
  #   end
  #   if @frames[9].strike? == false && @frames[9].spare? == false
  #     scoresheet_array[2].slice!(56)
  #     scoresheet_array[2].insert(56, "#{@frames[9].first_roll}")
  #     scoresheet_array[2].slice!(58)
  #     scoresheet_array[2].insert(58, "#{@frames[9].second_roll}")
  #   elsif @frames[9].spare?
  #     scoresheet_array[2].slice!(56)
  #     scoresheet_array[2].insert(56, "#{@frames[9].first_roll}")
  #     scoresheet_array[2].slice!(58)
  #     scoresheet_array[2].insert(58, "/")
  #     if @frames[9].bonus_roll != 10
  #       scoresheet_array[2].slice!(60)
  #       scoresheet_array[2].insert(60, "#{@frames[9].bonus_roll}")
  #     else
  #       scoresheet_array[2].slice!(60)
  #       scoresheet_array[2].insert(60, "X")
  #     end
  #   elsif @frames[9].strike?
  #     scoresheet_array[2].slice!(56)
  #     scoresheet_array[2].insert(56, "X")
  #     if @frames[9].second_roll != 10
  #       scoresheet_array[2].slice!(58)
  #       scoresheet_array[2].insert(58, "#{@frames[9].second_roll}")
  #       if @frames[9].second_roll + @frames[9].bonus_roll != 10
  #         scoresheet_array[2].slice!(60)
  #         scoresheet_array[2].insert(60, "#{@frames[9].bonus_roll}")
  #       else
  #         scoresheet_array[2].slice!(60)
  #         scoresheet_array[2].insert(60, "/")
  #       end
  #     elsif @frames[9].second_roll == 10
  #       scoresheet_array[2].slice!(58)
  #       scoresheet_array[2].insert(58, "X")
  #       if @frames[9].bonus_roll != 10
  #         scoresheet_array[2].slice!(60)
  #         scoresheet_array[2].insert(60, "#{@frames[9].bonus_roll}")
  #       else
  #         scoresheet_array[2].slice!(60)
  #         scoresheet_array[2].insert(60, "X")
  #       end
  #     end
  #   end
  #   score = 0
  #   frames = (1..9).to_a
  #   frames.each do |frame|
  #     score += frame_score(frame)
  #     if score.digits.count == 1
  #       scoresheet_array[3].slice!(3 + (6 * (frame - 1)))
  #       scoresheet_array[3].insert(3 + (6 * (frame - 1)), "#{score}")
  #     elsif score.digits.count == 2
  #       scoresheet_array[3].slice!(2 + (6 * (frame - 1)))
  #       scoresheet_array[3].slice!(3 + (6 * (frame - 1)))
  #       scoresheet_array[3].insert(2 + (6 * (frame - 1)), "#{score}")
  #     elsif score.digits.count == 3
  #       scoresheet_array[3].slice!(2 + (6 * (frame - 1)))
  #       scoresheet_array[3].slice!(3 + (6 * (frame - 1)))
  #       scoresheet_array[3].slice!(4 + (6 * (frame - 1)))
  #       scoresheet_array[3].slice!(5 + (6 * (frame - 1)))
  #       scoresheet_array[3].slice!(6 + (6 * (frame - 1)))
  #       scoresheet_array[3].insert(2 + (6 * (frame - 1)), "#{score} |")
  #     end
  #   end
  #   score += frame_score(10)
  #   if score.digits.count == 1
  #     scoresheet_array[3].slice!(58)
  #     scoresheet_array[3].insert(58, "#{score}")
  #   elsif score.digits.count == 2
  #     scoresheet_array[3].slice!(57)
  #     scoresheet_array[3].slice!(58)
  #     scoresheet_array[3].insert(57, "#{score}")
  #   elsif score.digits.count == 3
  #     scoresheet_array[3].slice!(57)
  #     scoresheet_array[3].slice!(58)
  #     scoresheet_array[3].slice!(59)
  #     scoresheet_array[3].slice!(60)
  #     scoresheet_array[3].slice!(61)
  #     scoresheet_array[3].insert(57, "#{score} |")
  #   end
  #   puts scoresheet_array
  # end
end
