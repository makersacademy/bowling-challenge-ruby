require 'frame'    # The frame is a smaller unit of scoring the game
                   # Made up of one two, or possibly in the tenth and final
                   # frame, ten rolls.


# BowlingScoreManager uses Singleton design pattern
class BowlingScoreManager

  @@roll3_frame_10 = 0  # Manage the one-off final frame optional roll

  def self.score_game( rolls )
    # In the simplest case rolls is array of twenty roll hits
    # such that none of them cause a spare or a strike
    # and so can basically be added together grouped into
    # frames of two rolls each
      
    # Setup array of Frames
    @frames = self.setup_frames();
    # Populate @frames in simple case and score
    # by simply adding the rolls
    self.score_frames( rolls );
    return self.get_grand_total( @frames )
  end
    
    
  def self.score_frames( rolls )
    frame_num = 1
    on_roll = 1
    for roll_from_start in 0...rolls.size
      if frame_num == 10
        # Handle remaining sub-array separately
        handle_frame_10( rolls.drop(roll_from_start) )
        # Exit the loop completely as work now done
        break
      end
      # Remainder to be put in else after frame_num == 10 handled?
      if on_roll == 1
        # Enter value from rolls as roll1
        # into appropriate frame
        self.manage_frame_roll1( rolls[roll_from_start], @frames, frame_num );
        if @frames[frame_num].status == :strike
          # Strike recorded in current frame
          # Move to roll one in next frame
          frame_num += 1
          next
        end
        on_roll = 2
        next
      else
        # Enter value from rolls as roll2
        # into appropriate frame
        self.manage_frame_roll2( rolls[roll_from_start], @frames, frame_num );        
        if @frames[frame_num].status == :spare
          # Go on to next roll as what follows is for normal frames
          frame_num += 1
          on_roll = 1
          next
        end
        # frame_num is usually incremented after every second
        # roll because two rolls per frame
        frame_num += 1
        on_roll = 1
      end
      
=begin
        # Enter value from rollsArray as roll2
        # into appropriate frame
#binding.irb
          (@frames[frame_num]).roll2 = rolls[roll_from_start]
          # Deal with possible strike from previous frame
          if ((frame_num > 1) && @frames[frame_num-1].status == :strike)
            # Add this roll to previous frame and then mark completed
            # because this is second of two rolls need to be added to a strike
            @frames[frame_num-1].total += (@frames[frame_num]).roll2
            @frames[frame_num-1].completed = true
          end          
          # Mark possible spare in this frame
          if ((@frames[frame_num].roll1) + (@frames[frame_num].roll2) == 10)
            @frames[frame_num].status = :spare
            @frames[frame_num].total = 10
            @frames[frame_num].completed = false
            frame_num += 1
            # Go to next roll as below is for normal frames
            on_roll = 1
            next
          end
          # For normal status do below but will need to amend for spare and strike
          @frames[frame_num].total = @frames[frame_num].roll1 + @frames[frame_num].roll2
          @frames[frame_num].completed = true
          # frame_num is usually incremented after every second
          # roll because two rolls per frame
          frame_num += 1
          on_roll = 1
      end
=end
    end
  end
   
        
  def self.setup_frames
    # @frames[0] = nil and use @frames[1] through @frames[10] inclusive
    # as this models the domain more closely
    frames_array = [nil];
    (1..10).each { frames_array << Frame.new }
    return frames_array;
  end
  

  def self.manage_frame_roll1( rollValue, frames, frame_num );
    # Record most recent roll in current frame
    (frames[frame_num]).roll1 = rollValue
    # Deal with possible spare from previous frame
    if ((frame_num > 1) && frames[frame_num-1].status == :spare)
      # Add this roll to previous frame and mark it completed
      frames[frame_num-1].total += (frames[frame_num]).roll1
      frames[frame_num-1].completed = true
    end
    # Deal with possible strike from previous frame
    if ((frame_num > 1) && frames[frame_num-1].status == :strike)
      # Add this roll to previous frame but don't yet mark completed
      # because two rolls need to be added to a strike
      frames[frame_num-1].total += (frames[frame_num]).roll1
      # Deal with possible strike from two frames ago
      if ((frame_num > 2) && frames[frame_num-2].status == :strike)
        # Add this roll to strike from two frames ago
        # and mark it complete as both of its following rolls
        # have now been added
        frames[frame_num-2].total += (frames[frame_num]).roll1
        frames[frame_num-1].completed = true
      end
    end
    # Mark possible strike in this frame
    if (frames[frame_num]).roll1 == 10
      frames[frame_num].status = :strike
      frames[frame_num].roll2 = 0
      frames[frame_num].total = 10
      frames[frame_num].completed = false
      # Need to check for this condition on return and update frame number there
      # frame_num += 1
      # Go to next roll, still considering on_roll to be 1
    end
  end

  
  def self.manage_frame_roll2( rollValue, frames, frame_num );        

    # Enter value from rolls as roll2
    # into appropriate frame

    (frames[frame_num]).roll2 = rollValue
    # Deal with possible strike from previous frame
    if ((frame_num > 1) && frames[frame_num-1].status == :strike)
      # Add this roll to previous frame and then mark completed
      # because this is second of two rolls need to be added to a strike
      frames[frame_num-1].total += (frames[frame_num]).roll2
      frames[frame_num-1].completed = true
    end          
    # Mark possible spare in this frame
    if ((frames[frame_num].roll1) + (frames[frame_num].roll2) == 10)
      frames[frame_num].status = :spare
      frames[frame_num].total = 10
      frames[frame_num].completed = false
      # Need to check this condition and manage below upon return
      # frame_num += 1
      # Go to next roll as below is for normal frames
      # on_roll = 1
      # next
      return
    end
    # For normal status do below but will need to amend for spare and strike
    frames[frame_num].total = frames[frame_num].roll1 + frames[frame_num].roll2
    frames[frame_num].completed = true
    # frame_num is usually incremented after every second
    # roll because two rolls per frame
    # Will have to deal with below on return
    # frame_num += 1
    # on_roll = 1
    return
  end

  
  def self.handle_frame_10( last_rolls )
    frame_num = 10
    on_roll = 1
    # Similar loop to above just slightly modified
    for rolls_at_end in 0...last_rolls.size
      if on_roll == 1
        # Enter value from last_rolls as roll1
        # into appropriate frame
#binding.irb
        (@frames[frame_num]).roll1 = last_rolls[rolls_at_end]
        # Deal with possible spare from previous frame
        if ((frame_num > 1) && @frames[frame_num-1].status == :spare)
          # Add this roll to previous frame and mark it completed
          @frames[frame_num-1].total += (@frames[frame_num]).roll1
          @frames[frame_num-1].completed = true
        end
        # Deal with possible strike from previous frame
        if ((frame_num > 1) && @frames[frame_num-1].status == :strike)
          # Add this roll to previous frame but don't yet mark completed
          # because two rolls need to be added to a strike
          @frames[frame_num-1].total += (@frames[frame_num]).roll1
          # Deal with possible strike from two frames ago
          if ((frame_num > 2) && @frames[frame_num-2].status == :strike)
            # Add this roll to strike from two frames ago
            # and mark it complete as both of its following rolls
            # have now been added
            @frames[frame_num-2].total += (@frames[frame_num]).roll1
            @frames[frame_num-1].completed = true
          end
        end
        # Mark possible strike in this frame
        if (@frames[frame_num]).roll1 == 10
          @frames[frame_num].status = :strike
          @frames[frame_num].roll2 = 0
          @frames[frame_num].total = 10
          @frames[frame_num].completed = false
          # We don't increase frame number in frame 10
          # frame_num += 1
          # Go to next roll, moving to roll2
          on_roll = 2
          next
        end
        # Switch to roll2 for next iteration
        on_roll = 2
        next
      elsif on_roll == 2
        # Enter value from rollsArray as roll2
        # into appropriate frame
#binding.irb
        (@frames[frame_num]).roll2 = last_rolls[rolls_at_end]
        # Deal with possible strike from previous frame
        if ((frame_num > 1) && @frames[frame_num-1].status == :strike)
          # Add this roll to previous frame and then mark completed
          # because this is second of two rolls need to be added to a strike
          @frames[frame_num-1].total += (@frames[frame_num]).roll2
          @frames[frame_num-1].completed = true
        end          
        # Mark possible spare in this frame
        if ((@frames[frame_num].roll1) + (@frames[frame_num].roll2) == 10)
          @frames[frame_num].status = :spare
          @frames[frame_num].total = 10
          @frames[frame_num].completed = false
          # Do not increment frame number in frame 10
          # frame_num += 1
          # Go to third roll as below is for normal frames
          on_roll = 3
          next
        end
      else # on_roll == 3
        # Add last roll value to current total
        @frames[frame_num].total += last_rolls[rolls_at_end]
        # No need to loop further
        break
      end
      # For normal status do below but will need to amend for spare and strike
      @frames[frame_num].total = @frames[frame_num].roll1 + @frames[frame_num].roll2
      @frames[frame_num].completed = true
      # Game ended so no need to increment frame number or on_roll
      # frame_num += 1
      # on_roll = 1      
    end
  end
  
  
  def self.get_grand_total( frames )
    grand_total = 0
    for i in 1..10
      grand_total += frames[i].total
    end
    return grand_total
  end
  
  
end
