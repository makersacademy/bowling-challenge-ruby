App flow:
- 1: welcome_message: Welcome to Bowling Scorecard Program!
- 2: instructions: Please enter your scores as prompted to receive your final score in the end. 


```ruby

class App
  def initialize
    @frames = [[],[],[],[],[],[],[],[],[],[]] 
    # Array of 10 arrays representing 10 frames.
    # Each sub-array should contain 2 or 3 integers:
    # 1st roll, 2nd roll (unless Strike) and
    # Bonus (if Strike or Spare in previous frame).
  end

  def run
    frames[0..8].each.with_index(1) do |frame, i|
      puts "Frame #{i}. "

      frame == player_rolls(frame)

      # Calculates bonus points
      if i > 1
        previous_frame = frames[i-1]
        frame << bonus_points?(previous_frame, frame)
      end

    end
  end

  def bonus_points?(previous_frame, frame)
    if previous_frame[0] == 10
      frame.sum
    elsif previous_frame.sum == 10
      frame[0]
    else 
      0
    end
  end


  def player_rolls(frame)
    puts "Roll 1:"
    frame << get_user_input

    if frame[0] < 10
      puts "Roll 2:"
      frame << get_user_input
    end

    frame
  end


  def get_user_input
    # validate_input
    # returns integer
  end


  ## Nice to haves

  def validate_input
    # if > 10 or if < 0
    # if frame.sum > 10
    # if string = incorrect
    # "Incorrect input!"
    # "Only x pins left" - nice to have but not priotity
  end

end
```
