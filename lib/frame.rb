class Frame

  def self.create
    # Initialise as an array
    frames = Array.new
    # Create all ten frames at start of game as need to be able to pass strike/spare info
    9.times { frames.push(Frame.new(frames.first)) }
    frames
  end

  def initialize(next_frame)
    @rolls = []
    @next_frame = next_frame
  end

  def roll(pin_count)
    @rolls << pin_count
  end

  def score
    # Use reduce method rather than find sum via a loop - see https://apidock.com/ruby/Enumerable/reduce
    # Need || to allow for no score otherwise get TypeError of nil can't be coerced into Integer
    @rolls.reduce(:+) || 0
  end

end
