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
      elsif first_bowl? && (pins == 10)
        @rolls << "-"
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
    spare_score # + strike_points
  end

  def first_bowl?
    @rolls.length % 2 == 1
  end

  # def strike_points
  #   sum = 0
  #   @rolls.each_cons(3) do |bowl| 
  #     if bowl[0] == "-"
  #       bowls = @rolls.map { |roll| roll == "-" ? 0 : roll } 
  #       sum += bowls.inject(0, :+)
  #     end
  #   end
  #   sum
  # end
  
  def spare_score
    sum = 0
    2.times { @rolls << 0 }
    frames = @rolls.each_slice(2).to_a # this creates frames
    frames.each_with_index do |frame, i| # each frame with it's index
      unless frame.include?("-") # disregard if frame is a strike
        if frame.inject(0, :+) == 10 # if the frame's scores add up to 10
          i += 1
          puts "this is frames #{frames}"
          puts "this is frames[i][0] #{frames[i][0]}"
          sum += frames[i][0] ##  #
        end
      end
    end
    p sum
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

# if "-", add each two consectuvive together