class BowlingGame
  def initialize
    @frame = []
  end

  def roll(points)
    @frame.push(points)
  end

  def score
    result = 0
    roll_index = 0

    10.times do 
      if roll_a_spare?(roll_index)
        result += spare_score(roll_index)
      else
        result += @frame[roll_index] + @frame[roll_index + 1 ]
      end
      roll_index += 2
    end
    return result
  end


  private

  def roll_a_spare?(roll_index)
    @frame[roll_index] + @frame[roll_index + 1 ] == 10
  end

  def spare_score(roll_index)
    @frame[roll_index] + @frame[roll_index + 1] + @frame[roll_index + 2]
  end
end






# user_rolls = [6,7,9,2,1,6,3,5];
#               0,1,2,3,4,5,6,7 
#               current index = 0

# user_rolls = [10,7,3,2,1,6,3,5];
#               currentindex = 2  (10)
#               currentindex + 1  (2)
              # currentindex + 2  (9)

