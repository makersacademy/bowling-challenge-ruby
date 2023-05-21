class Scores
  
  def initialize(io)
    @io = io
    @total_score = 0
  end

  def roll
    @io.puts 'Enter score:'
    input = @io.gets.chomp.to_i
    if input < 10
      @frame_score += input
    end
  end

  def frame
    @frame_score = 0
    self.roll
    self.roll
    @total_score += @frame_score
    @io.puts "Frame score: #{@frame_score}"
  end

  def last_frame
    @frame_score = 0
    self.roll
    self.roll
    if @frame_score == 10
      self.roll
    end
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
# game.run