class Bowling
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def frame(roll_one, roll_two = 'strike')
    @rolls << if roll_one == 10
                { first: roll_one }
              else
                { first: roll_one, second: roll_two }
              end
  end

  def tenth_frame(roll_one, roll_two, roll_three = 'no strike or spare')
    @rolls << if roll_three == 'no strike or spare'
                { first: roll_one, second: roll_two }
              else
                { first: roll_one, second: roll_two, third: roll_three }
              end
  end

  def score_frame(frame)
    if frame == 9 && @rolls[frame - 1][:first] == 10 # strike in the 9th frame
      @rolls[frame - 1][:first] + @rolls[frame][:first] + @rolls[frame][:second]
    elsif @rolls[frame - 1][:first] == 10 && @rolls[frame][:first] == 10 # strike followed by another strike
      @rolls[frame - 1][:first] + @rolls[frame][:first] + @rolls[frame + 1][:first]
    elsif @rolls[frame - 1][:first] == 10 # strike
      @rolls[frame - 1][:first] + @rolls[frame][:first] + @rolls[frame][:second]
    elsif @rolls[frame - 1][:first] + @rolls[frame - 1][:second] == 10 # spare
      @rolls[frame - 1][:first] + @rolls[frame - 1][:second] + @rolls[frame][:first]
    else
      @rolls[frame - 1][:first] + @rolls[frame - 1][:second]
    end
  end

  def score_tenth_frame
    if @rolls[9][:first] + @rolls[9][:second] >= 10
      @rolls[9][:first] + @rolls[9][:second] + @rolls[9][:third]
    else
      @rolls[9][:first] + @rolls[9][:second]
    end
  end
end
