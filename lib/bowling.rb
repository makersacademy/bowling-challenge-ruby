class Bowling

attr_reader :scorecard, :roll

  def initialize
    @scorecard = []
  end


  def roll(number)
    @scorecard << number
  end


  def frame1
  if @scorecard[0] == 10 && @scorecard[2] == 10
      return @scorecard[0] + @scorecard[2] + @scorecard[4]
    elsif @scorecard[0] == 10
      return @scorecard[0] + @scorecard[2] + @scorecard[3]
    elsif @scorecard[0] + @scorecard[1] == 10
        return @scorecard[0] + @scorecard[1] + @scorecard[2]
    else
       return @scorecard[0] + @scorecard[1]
    end
  end
# Work in progress.
# Am I really going to have a method for each frame???
# Havent figured out Frame 10 yet.
# Maybe a hash where each key is a roll, or a hash where each element is a array with the 2 rolls?


end
