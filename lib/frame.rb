class Frame
  def initialize(io)
    @io = io
    @frame = []
    @pins = 0
  end

  def check_invalid
    raise 'Invalid entry.' if (@pins < 0 || @pins > 10) 
    raise 'Invalid entry.' if @frame.size == 1 && (@pins < 0 || @pins > (10 - @frame[0])) 
  end

  def roll
    @pins = @io.gets.to_i
    check_invalid
    @frame << @pins
  end

  def strike?
    @frame[0] == 10 && @frame.size == 1
  end

  def spare?
    @frame.sum == 10 && @frame.size == 2
  end

  def run
    roll
    return @frame = ['X'] if strike? 
    roll
    @frame[1] = '/' if spare?
    return @frame
  end

end