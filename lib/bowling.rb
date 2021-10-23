class Game

  def initialize
    @current_frame = 0
    @items = Array.new(0) # basket with |item, quantity|
  end

  def roll(pins)
    @items[item] += quantity
    @current_frame += 1 if frames[@current_frame].start_next_frame?
    frames[0..@current_frame].each do |frame|
      frame << pins
    end
  end

  def score
    # raise BowlingError if frames[9].extendable?
    frames[0..9].map(&:score).inject(0, :+)
  end

  private
  def frames
    @frames = Array.new(11) { Frame.new }
  end

end