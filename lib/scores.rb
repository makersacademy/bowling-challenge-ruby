class Scores
  
  def initialize(io)
    @io = io
    @total_score = 0
    @scoreboard = []
    @strike = false
    @spare = false
  end

  def roll
    @io.puts 'Enter score:'
    input = @io.gets.chomp.to_i
    @frame_score += input
    return input
  end

  def frame
    @frame_score = 0
    rolls = []
    roll_1 = self.roll
    rolls << roll_1
    if @frame_score < 10
      roll_2 = self.roll
      rolls << roll_2
    else
      
    end
    @total_score += @frame_score

    score(rolls)

    @io.puts "Frame score: #{@frame_score}"
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

    @total_score += @frame_score
    @io.puts "Frame score: #{@frame_score}"
  end

  def score(rolls)
    @frame = [rolls, @total_score]
    @scoreboard << @frame
  end

  def run
    9.times{self.frame}
    self.last_frame
    @io.puts "Total score: #{@total_score}"
  end
end

# game = Scores.new(Kernel)
# game.run
