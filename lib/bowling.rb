
class Bowling

  attr_reader :frames, :frame, :spare_counter, :strike_counter, :strike_counter2
  
  def initialize
    @frames = []
    @frame = []
    @spare_counter = []
    @strike_counter = []
    @strike_counter2 = []
  end
  
  def roll(pins)
    @frame << pins
    if @strike_counter == [10] && @frame.length == 1 && @frame != [10]
      @strike_counter << pins
    elsif spare?(@frame) && @strike_counter.length == 2
      puts "spare"
      @spare_counter << 10
      @strike_counter << pins
      @frame = []
      @frames << [@strike_counter.sum]
      @strike_counter = []
    elsif strike?(@frame) && @spare_counter == [10]
      @spare_counter << pins
      @frames << [@spare_counter.sum]
      @spare_counter = []
      puts "strike"
      @strike_counter << 10
      @frame = []
    elsif @strike_counter.length == 2 && @strike_counter2.length == 1 && @frame != [10]
      puts "strike"
      @strike_counter << pins
      @strike_counter2 << pins
      @frames << [@strike_counter.sum]
      @frames << @frame
      @strike_counter = @strike_counter2
      @strike_counter2 = []
      @frame = []
    elsif @strike_counter.length == 2 && @strike_counter2.length == 1 && @frame == [10]
      puts "strike"
      @strike_counter << pins
      @strike_counter2 << pins
      @frames << [@strike_counter.sum]
      # @frames << @frame
      @strike_counter = [10, 10]
      @strike_counter2 =[10]
      @frame = []
    elsif @strike_counter.length == 2 && @strike_counter2.length == 1
      puts "strike"
      @strike_counter << pins
      @strike_counter2 << pins
      @frames << [@strike_counter.sum]
      # @frames << @frame
      @strike_counter = @strike_counter2
      @strike_counter2 = []
      @frame = []
    elsif @strike_counter.length == 1 && @frame == [10]
      puts "strike"
      @strike_counter << 10
      @strike_counter2 << 10
      @frame = []
    elsif @strike_counter.length == 1 
      @strike_counter << pins
    elsif @strike_counter.length == 2
      @strike_counter << pins
      @frames << [@strike_counter.sum]
      @frames << @frame
      @strike_counter = []
      @frame = []
    elsif @spare_counter == [10]
      @spare_counter << pins
      frames << [@spare_counter.sum]
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
       score += frame.sum
    end
    score
  end 

  private

  def spare?(frame)
    frame.length == 2 && frame.sum == 10 
  end

  def strike?(frame)
    frame == [10]
  end

end