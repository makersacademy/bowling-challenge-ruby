require_relative '../lib/frame'

class GameRepository
  def initialize
    @frames = []
    9.times do @frames.push(Frame.new(false)) end # [0, 0]
    @frames.push(Frame.new(true)) # => [0, 0, 0]
    @frame_index = 0
 
  end

  # put the score into a Frame
  def add(pins)
    return if is_finished?()
    current_frame = @frames[@frame_index]

    current_frame.add(pins)

    if current_frame.is_finished?
      @frame_index += 1
    end
  end

  def is_finished? # returns a boolean
    @frame_index == 10
  end
  
  #count frames
  #adding score of each frame
  def score_card
    total_score = 0
   
    @frames.each_with_index do |current_frame, index| 
      next_frame = @frames[index + 1]

      #  0  1  2  3  4  5  6  7  8   9
      # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

      if index < 9
        if current_frame.is_strike?
            total_score += current_frame.roll_score + next_frame.getRolls[0] +  next_frame.getRolls[1]
        elsif current_frame.is_spare?
            total_score += current_frame.roll_score  + next_frame.getRolls[0] 
        else
            total_score += current_frame.roll_score
        end
      else
        # strike/spare => 3 rolls
        # normal => 2 rolls
        total_score += current_frame.roll_score
      end
    end

    return total_score
  end
end

      # current = @fames[@frame_index] => @frames[1]
    # frame.add(5)
    # frame.add(5)
    # frame.add(5)
    # frame.add(5)
    # frame.add(5)
    # frame.add(5)
    # 
    # if !@frames[@frame_index].frame_complete?
    #   @frames[@frame_index].add(roll)
    # else
    #   @frame_index += 1
    # end#

    # frame.getRolls => [0, 0]
    # frame.getRolls[0] = 8
    # frame.getRolls[1] = 2
    # frame.getRolls => [8, 2]


    #  a = [1, 2, 3]
    #  a.each do |num|
    #    puts num
    #  end

    # Frame
    #  - return a total score of the frame
    #  - return a boolean to tell if the frame is ended
    #  - return a boolean if it's a strike
    #  - return a boolean if it's a spare
    
    # looping the @frames
    # check if the frame is a strike/spare/normal
    #   frame = @frames[frame_index]
    #   next_frame = @frame[frame_index + 1]
    # 
    #     if frame.is_strike?
    #       frame.roll_score + next_frame.getRolls[0] + next_frame.getRolls[1]
    #     elsif frame.is_spare?
    #       frame.roll_score + next_frame.getRolls[0]
    #     else
    #       frame.roll_score
    #     end


    #  total_score = 0
    #  frame = Frame.new();
    # 
    #  frame_index = 0
    #  @frames[0]
    #  @frames[1] 
    #  
    #  next = @frames[@frame_index + 1]
    # 
    #  if frame.is_spare?
    #     total_score += frame.roll_score + next.getRolls[0]
    #  elsif frame.is_strike?
    #     total_score += frame.roll_score  + next.getRolls[0] +  next.getRolls[1]
    #  else
    #     total_score += frame.roll_score
    #  end
    

    
    #@rolls.sum
    # roll_index = 0
  #   score = 0
  #    10.times do
  #    if @rolls[roll_index] + @rolls[roll_index + 1] == 10 #spare
  #     score += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
  #     elsif @rolls[roll_index] +@rolls[roll_index +1] != 10 # frame score accumulation <10
  #     score += @rolls[roll_index] + @rolls[roll_index + 1] 
  #     elsif @rolls[roll_index] == 10 # Check Strike- previous  fail appeared to be due to rspec - further tests needed to ensure- bonus score is calculated the bonus feature.
  #     score += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
  #     roll_index += 1
  #  end
  #     roll_index += 2
  #    end
  #     score
  #   end

 
 