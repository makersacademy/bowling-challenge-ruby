class Scores
  
  def initialize(io)
    @io = io
    @total_score = 0
    @scoreboard = []
  end

  def roll
    @io.puts 'Enter score:'
    input = @io.gets.chomp.to_i
    @frame_score += input
    return input
  end

  def frame
    @frame_score = 0
    roll_1 = self.roll
    roll_2 = self.roll
    @total_score += @frame_score
    @frame = [[roll_1, roll_2], @total_score]
    @scoreboard << @frame
    @io.puts "Frame score: #{@frame_score}"
  end

  def last_frame
    @frame_score = 0
    rolls = [self.roll, self.roll]
    if @frame_score >= 10
      rolls << self.roll
    end
    @frame = [rolls, @total_score]
    @scoreboard << @frame
    @total_score += @frame_score
    @io.puts "Frame score: #{@frame_score}"
  end

  def run
    9.times{self.frame}
    self.last_frame
    @io.puts "Total score: #{@total_score}"
  end
end

# game = Scores.new(Kernel)
# game.last_frame
