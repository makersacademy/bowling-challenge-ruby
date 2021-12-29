
class Bowling

  attr_reader :frames, :frame, :spare_counter, :strike_counter
  
  def initialize
    @rolls = []
    @frames = []
    @frame = []
    @spare_counter = []
    @strike_counter = []
  end
  
  def roll(pins)
    @frame << pins
    if @strike_counter.length == 1 
      @strike_counter << pins
    elsif @strike_counter.length == 2
      @strike_counter << pins
      frames << [@strike_counter.inject(:+)]
      @frames << @frame
      @strike_counter = []
      @frame = []
    elsif @spare_counter == [10]
      @spare_counter << pins
      frames << [@spare_counter.inject(:+)]
      @spare_counter = []
    else 
      if strike?(@frame)
        puts "strike"
        @strike_counter << 10
        @frame = []
      elsif spare?(@frame)
        puts "spare"
        @spare_counter << 10
        @frame = []
      elsif @frame.length == 2
        @frames << @frame
        @frame = []
      end
    end
  end

  def score 
    score = 0
    @frames.each do |frame|
       score += frame.inject(:+)
    end
    score
  end 

  def spare?(frame)
    frame.length == 2 && frame.inject(:+) == 10 
  end

  def strike?(frame)
    frame == [10]
  end

end