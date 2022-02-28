require 'last_frame'

class Frame
  MAX_PINS = 10
  FIRST_ROLL = 1
  SECOND_ROLL = 2
  THIRD_ROLL = 3

  def self.create
    # Initialise as an array
    frames = Array.new
    # Create all ten frames at start of game as need to be able to pass strike/spare info
    # Use unshift to ADD to the BEGINNING of the array
    frames.unshift(LastFrame.new(frames.first))
    9.times { frames.unshift(Frame.new(frames.first)) }
    frames
  end

  def initialize(next_frame)
    @rolls = []
    @next_frame = next_frame
  end

  def roll(pin_count)
    @rolls << pin_count
  end

  # Use reduce method rather than find sum via a loop - see https://apidock.com/ruby/Enumerable/reduce
  # Need || to allow for no score otherwise get TypeError of nil can't be coerced into Integer
  def score
    if strike? || spare?
      pin_count_from_rolls(THIRD_ROLL)
    else
      @rolls.reduce(:+) || 0
    end
  end

  # Working out if strike or spare across the different frames
  def pin_count_from_rolls(count)
    return 0 if @rolls.empty?

    player_rolls = [@rolls.length, count].min
    pins = @rolls.first(player_rolls).reduce(&:+)
    if count > player_rolls
      pins += @next_frame.pin_count_from_rolls(count - player_rolls)
    end
    pins
  end

  # If the first roll knocks down 10 pins then it is a strike and also the frame is over
  def strike?
    @rolls.first == MAX_PINS
  end

  # If the number of rolls in the frame is greater than one (so not a strike) and the total number of pins knocked down is ten
  # then it is a spare
  def spare?
    @rolls.length > FIRST_ROLL && pin_count_from_rolls(SECOND_ROLL) == MAX_PINS
  end

  # The frame is finished if either two rolls have been made or there was a strike on the first roll
  def bowled?
    @rolls.length > FIRST_ROLL || strike?
  end
end
