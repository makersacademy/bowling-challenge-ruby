class Bowling

attr_reader :scorecard, :roll

  def initialize
    @scorecard = []
    total = 0
    index = 0
  end


  def roll(number)
    @scorecard << number
  end


  def score
    total = @scorecard.reduce(:+)

  end
  # def score
  # if @scorecard[0] == 10 && @scorecard[2] == 10
  #     return @scorecard[0] + @scorecard[2] + @scorecard[4]
  #   elsif @scorecard[0] == 10
  #     return @scorecard[0] + @scorecard[2] + @scorecard[3]
  #   elsif @scorecard[0] + @scorecard[1] == 10
  #       return @scorecard[0] + @scorecard[1] + @scorecard[2]
  #   else
  #      return @scorecard[0] + @scorecard[1]
  #   end
  # end
# Work in progress.



end
