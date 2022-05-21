class Frame
  attr_reader :frame_number, :roll_1, :roll_2

  def initialize(frame_number)
    @frame_number = frame_number
    @roll_1 = nil
    @roll_2 = nil
    @strike = false
    @spare = false
  end

  def run
    puts "Frame number #{@frame_number}"
    puts "Roll 1?"
    @roll_1 = gets.chomp.to_i
    calculate_strike
    if !strike?
      puts "Roll 2?"
      @roll_2 = gets.chomp.to_i
      calculate_spare
    end
  end

  def strike?
    @strike
  end

  def spare?
    @spare
  end

  def total
    if @roll_2 == nil
      @roll_1
    else
      @roll_1 + @roll_2
    end
  end

  private

  def calculate_strike
    if @roll_1 == 10
      puts "Strike!"
      @strike = true
    end
  end

  def calculate_spare
    if self.total == 10 && @roll_1 != 10
      puts "Spare!"
      @spare = true
    end
  end
  
end