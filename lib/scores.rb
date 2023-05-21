class Scores
  
  def initialize(io)
    @io = io
    @total_score = 0
    @scoreboard = []
    @strike = 1
    @spare = 1
    @frame = 1
  end

  def roll
    @io.puts 'Enter score:'
    input = @io.gets.chomp.to_i
    @frame_score += input
    @total_score += input * @spare
    return input
  end

  def frame
    @frame += 1
    @frame_score = 0
    rolls = []

    roll_1 = self.roll
    rolls << roll_1
    @spare = 1
    
    if @frame_score < 10
      roll_2 = self.roll
      rolls << roll_2
    end

    score(rolls)

    @io.puts "Frame score: #{@frame_score}"
    bonus(roll_1, roll_2)
  end

  def last_frame
    @frame_score = 0
    
    rolls = []
    
    roll_1 = self.roll
    roll_2 = self.roll

    rolls << roll_1
    rolls << roll_2

    if @frame_score >= 10
      roll_3 = self.roll
      rolls << roll_3
    end

    score(rolls)

    @io.puts "Frame score: #{@frame_score}"
  end

  def score(rolls)
    @scoreboard << rolls
    return @scoreboard
  end

  def bonus(roll_1, roll_2)
    if roll_1 == 10
      @strike = 2
    elsif roll_1 + roll_2 == 10
      @spare = 2
    else
      @strike = 1
      @spare = 1
    end
  end

  def total
    @io.puts "Total score: #{@total_score}"
  end

  def run
    9.times{self.frame}
    self.last_frame
    self.total
  end
end

# game = Scores.new(Kernel)
# game.frame
# game.frame
# game.run
