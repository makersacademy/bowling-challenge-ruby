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
    true if @frame[0] == 10 && @frame.size == 1
  end

  def spare?
    true if @frame.size == 2 && @frame.sum == 10
  end

  def run
    roll
    return @frame = ['X'] if strike? 
    roll
    @frame[1] = '/' if spare?
    return @frame
  end

  def tenth
    @pins = @io.gets.to_i
    @pins = 'X' if @pins == 10
    @frame << @pins
    @pins = @io.gets.to_i
    @frame << @pins
    if (!@frame.include? 'X') && @frame.sum == 10
      @frame[1] = '/'
    end
    if (@frame.include? '/') || (@frame.include? 'X')
      @pins = @io.gets.to_i
      @frame << @pins
    end
    return @frame
  end

end