require 'frame'

class BowlingScoreManager
  def self.score( rollsArray )
    # In the simplest case rollsArray is array of twenty roll hits
    # such that none of them cause a spare or a strike
    # and so can basically be added together grouped into
    # frames of two rolls each
      
    # Setup array of Frames
    # @frames[0] = nil and use @frames[1] through @frames[10] inclusive
    @frames = [nil]
    (1..10).each { @frames << Frame.new }
#binding.irb    
    # Populate @frames in simple case and score
    # by simply adding the rolls
    frame_num = 1
    for roll_from_start in 0..19
#      previously used i for the loop index         
#      p "in for loop i is #{i}"
      if roll_from_start%2 == 0
        # Even number index
        # Enter value from rollsArray as roll1
        # into appropriate frame
#binding.irb
          (@frames[frame_num]).roll1 = rollsArray[roll_from_start]
          # Check for strike
          if (@frames[frame_num]).roll1 == 10
            @frames[frame_num].status = :strike
            @frames[frame_num].roll2 = 0
            @frames[frame_num].total = 10
            @frames[frame_num].completed = false
            frame_num += 1
          end
      else
        # Odd number index
        # Enter value from rollsArray as roll2
        # into appropriate frame
#binding.irb
          (@frames[frame_num]).roll2 = rollsArray[roll_from_start]
          # frame_num is only incremented after every second
          # entry because two rolls per frame
          frame_num += 1
      end
    end
    grand_total = 0
    for i in 1..10
      grand_total += (@frames[i].roll1 + @frames[i].roll2)
    end
    return grand_total
  end
end
