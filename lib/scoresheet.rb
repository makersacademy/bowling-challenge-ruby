require_relative './frame'

class Scoresheet

  def initialize(frame = Frame.new)
    @frames = []
    @current_frame = frame
  end

  def new_frame(frame = Frame.new)
    @current_frame = frame
  end

  def current_frame
    if @frames.length == 9
      tenth_frame
    elsif @current_frame.rolls == 2 || @current_frame.strike?
      @frames << @current_frame
      new_frame unless complete?
    else
      @current_frame
    end
    @current_frame
  end

  def tenth_frame
    if @current_frame.strike? || @current_frame.spare?
      @frames << @current_frame if @current_frame.rolls == 3
      @current_frame
    elsif @current_frame.rolls == 2
      @frames << @current_frame
    else
      @current_frame
    end
    @current_frame
  end

  def frame_score(num)
    score = 0
    score += strike_bonus(num - 1) if @frames[num - 1].strike?
    score += spare_bonus(num - 1) if @frames[num - 1].spare?
    score += @frames[num - 1].first_roll
    score += @frames[num - 1].second_roll if @frames[num - 1].strike? == false
    score
  end

  def strike_bonus(num)
    if num == 9
      @frames[9].second_roll + @frames[9].bonus_roll
    elsif num == 8 && @frames[9].strike?
      @frames[9].first_roll + @frames[9].second_roll
    elsif @frames[num + 1].strike?
      @frames[num + 1].first_roll + @frames[num + 2].first_roll
    else
      @frames[num + 1].first_roll + @frames[num + 1].second_roll
    end
  end

  def spare_bonus(num)
    if num == 9
      @frames[9].bonus_roll
    else
      @frames[num + 1].first_roll
    end
  end

  def complete?
    @frames.length == 10
  end

  def total_score
    current_frame
    score = 0
    frames = (1..10).to_a
    frames.each do |frame|
      score += frame_score(frame)
    end
    score
  end

#   def scoresheet
#     scoresheet_array = [ 
#       '_____________________________________________________________',
#       '|__1__|__2__|__3__|__4__|__5__|__6__|__7__|__8__|__9__|__10__|', 
#       '|   |_|   |_|   |_|   |_|   |_|   |_|   |_|   |_|   |_|  |_|_|',
#       '|     |     |     |     |     |     |     |     |     |      |',
#       '|_____|_____|_____|_____|_____|_____|_____|_____|_____|______|'
#     ]

#     frames = (0..8).to_a
#     frames.each do |frame|
#       if @frames[frame].strike? == false && @frames[frame].spare? == false
#         scoresheet_array[2].slice!(3 + (6 * frame))
#         scoresheet_array[2].insert(3 + (6 * frame), "#{@frames[frame].first_roll}")
#         scoresheet_array[2].slice!(5 + (6 * frame))
#         scoresheet_array[2].insert(5 + (6 * frame), "#{@frames[frame].second_roll}")
#       elsif @frames[frame].spare?
#         scoresheet_array[2].slice!(3 + (6 * frame))
#         scoresheet_array[2].insert(3 + (6 * frame), "#{@frames[frame].first_roll}")
#         scoresheet_array[2].slice!(5 + (6 * frame))
#         scoresheet_array[2].insert(5 + (6 * frame), "/")
#       elsif @frames[frame].strike?
#         scoresheet_array[2].slice!(5 + (6 * frame))
#         scoresheet_array[2].insert(5 + (6 * frame), "X")
#       end
#     end
#     if @frames[9].strike? == false && @frames[9].spare? == false
#       scoresheet_array[2].slice!(56)
#       scoresheet_array[2].insert(56, "#{@frames[9].first_roll}")
#       scoresheet_array[2].slice!(58)
#       scoresheet_array[2].insert(58, "#{@frames[9].second_roll}")
#     elsif @frames[9].spare?
#       scoresheet_array[2].slice!(56)
#       scoresheet_array[2].insert(56, "#{@frames[9].first_roll}")
#       scoresheet_array[2].slice!(58)
#       scoresheet_array[2].insert(58, "/")
#       if @frames[9].bonus_roll != 10
#         scoresheet_array[2].slice!(60)
#         scoresheet_array[2].insert(60, "#{@frames[9].bonus_roll}")
#       else
#         scoresheet_array[2].slice!(60)
#         scoresheet_array[2].insert(60, "X")
#       end
#     elsif @frames[9].strike?
#       scoresheet_array[2].slice!(56)
#       scoresheet_array[2].insert(56, "X")
#       if @frames[9].second_roll != 10
#         scoresheet_array[2].slice!(58)
#         scoresheet_array[2].insert(58, "#{@frames[9].second_roll}")
#         if @frames[9].second_roll + @frames[9].bonus_roll != 10
#           scoresheet_array[2].slice!(60)
#           scoresheet_array[2].insert(60, "#{@frames[9].bonus_roll}")
#         else 
#           scoresheet_array[2].slice!(60)
#           scoresheet_array[2].insert(60, "/")
#         end
#       elsif @frames[9].second_roll == 10
#         scoresheet_array[2].slice!(58)
#         scoresheet_array[2].insert(58, "X")
#         if @frames[9].bonus_roll != 10
#           scoresheet_array[2].slice!(60)
#           scoresheet_array[2].insert(60, "#{@frames[9].bonus_roll}")
#         else
#           scoresheet_array[2].slice!(60)
#           scoresheet_array[2].insert(60, "X")
#         end
#       end
#     end
#     score = 0
#     frames = (1..9).to_a
#     frames.each do |frame|
#       score += frame_score(frame)
#       if score.digits.count == 1
#         scoresheet_array[3].slice!(3 + (6 * (frame - 1)))
#         scoresheet_array[3].insert(3 + (6 * (frame - 1)), "#{score}")
#       elsif score.digits.count == 2
#         scoresheet_array[3].slice!(2 + (6 * (frame - 1)))
#         scoresheet_array[3].slice!(3 + (6 * (frame - 1)))
#         scoresheet_array[3].insert(2 + (6 * (frame - 1)), "#{score}")
#       elsif score.digits.count == 3
#         scoresheet_array[3].slice!(2 + (6 * (frame - 1)))
#         scoresheet_array[3].slice!(3 + (6 * (frame - 1)))
#         scoresheet_array[3].slice!(4 + (6 * (frame - 1)))
#         scoresheet_array[3].slice!(5 + (6 * (frame - 1)))
#         scoresheet_array[3].slice!(6 + (6 * (frame - 1)))
#         scoresheet_array[3].insert(2 + (6 * (frame - 1)), "#{score} |")
#       end
#     end
#     score += frame_score(10)
#     if score.digits.count == 1
#       scoresheet_array[3].slice!(3 + (6 * (frame - 1)))
#       scoresheet_array[3].insert(3 + (6 * (frame - 1)), "#{score}")
#     elsif score.digits.count == 2
#       scoresheet_array[3].slice!(2 + (6 * (frame - 1)))
#       scoresheet_array[3].slice!(3 + (6 * (frame - 1)))
#       scoresheet_array[3].insert(2 + (6 * (frame - 1)), "#{score}")
#     elsif score.digits.count == 3
#       scoresheet_array[3].slice!(57)
#       scoresheet_array[3].slice!(58)
#       scoresheet_array[3].slice!(59)
#       scoresheet_array[3].slice!(60)
#       scoresheet_array[3].slice!(61)
#       scoresheet_array[3].insert(57, "#{score} |")
#     end
#     scoresheet_array
#   end
end
