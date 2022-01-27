class Game
  attr_reader :rolls

  MAX_PINS = 10

  def initialize
    @rolls = [] 
    @max_rolls = 20
  end

  def roll(pins) 
    raise ("This is not valid input.") if pins > MAX_PINS
    raise ("Game Over. Ask for your score!") if @rolls.count == @max_rolls
    @rolls << pins
      if @rolls.count == 19 && (pins == 10) || @rolls.count == 20 && (@rolls[-1] + @rolls[-2]) == 10
        @max_rolls += 1
      else 
        @rolls << "-" if first_bowl? && (pins == 10) #if first bowl and score is 10
      end
  end

  def total_score
    pins_score + total_bonus_points
  end
  ##### private methods below??

  def pins_score 
    @scores = @rolls - ["-"]
    @scores.inject(0, :+)
  end

  def total_bonus_points
    # map over rolls or each_cons,.,,/1
    # unless tenth frame
    # only want to do it by frame... if second bowl
      # if strike i.e. "-"
        # add score for next two elements
      # if spare i.e. if index is odd && element plus last element == 10
        # add score for next two elements
    
    
    
  end

  def first_bowl?
    @rolls.length % 2 == 1
  end
  
end

## do I need a method that returns the roll and the index...
# what are some ways to retrieve the index from the rolls

# array.at(2) => array at index 2

# array.map.with_index {|roll, index|  } 
#### could use this to return all first rolls, then check if each one is a strike. 
#### might have to do something different for spares

# array.select.with_index {|roll, index| index % 2 == 0 }
#### this is looking promising for returning first and second bowls

# game.rolls.each_cons(3) { |n| p n[1, 2] }
# do I need to add some zeros on the end?