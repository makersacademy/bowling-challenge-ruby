class Bowling
  def initialize(io)
    @io = io
    @rolls = []
    @strike = false
    @spare = false
    self.welcome
  end

  def welcome
    @io.puts "Welcome to your bowling scorecard. Press any key to continue."
    start = @io.gets
    if start.include? "\n"
      frame
    end
  end

  def frame
    @io.puts "Please enter score for first roll:"
    @roll_1 = @io.gets.chomp.to_i
    if @roll_1 == 10
      strike
    else
      @io.puts "Please enter score for second roll:"
      @roll_2 = @io.gets.chomp.to_i
      if @roll_1 + @roll_2 == 10 && @roll_1 < 10
        spare
      else
        add_to_score
      end
    end
  end

  def add_to_score
    if @strike
      @rolls << [@roll_1*2, @roll_2*2]
    elsif @spare
      @rolls << [@roll_1*2, @roll_2]
    else
      @rolls << [@roll_1, @roll_2]
    end
    # if @rolls.length < 11
    #   scoreboard
    # end
    @strike = false
    @spare = false
    # frame
  end

  def strike
    if @strike
      @roll_1 = 20
    end
    @io.puts "Strike!!"
    @rolls << [@roll_1, 0]
    @strike = true
    # if @rolls.length <= 10
    #   scoreboard
    # end
    # frame
  end

  def spare
    if @spare
      @roll_1 = @roll_1*2
    end
    @io.puts "Spare!"
    @rolls << [@roll_1, @roll_2]
    @spare = true
    # if @rolls.length < 11
    #   scoreboard
    # end
    # frame
  end

 # def bonus_rolls


  def scoreboard
    @io.puts "Score so far: "
    frame_no = 1
    @rolls.each do |frame|
      @io.puts "Frame #{frame_no}: #{frame.sum}"
      frame_no += 1
    end
    @io.puts "-------------\nTotal: #{score}\n-------------"
  end

  def score
    total = @rolls.map { |frame| frame.sum }
    total.sum
  end
end

# bowling = Bowling.new(Kernel)