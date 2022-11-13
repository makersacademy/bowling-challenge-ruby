class BowlingScoring

  def initialize
    @score = []
    @scorecard = []
    @frames = 0
  end

  def collect_scores(terminal)
    @terminal = terminal
  # First 9 frames
    9.times do
      @terminal.puts "Frame #{@frames + 1}: How many pins did your 1st bowl knock down?"
      first_bowl = @terminal.gets.chomp.to_i
       if first_bowl == 10
        @scorecard << [first_bowl, 0]
       else
        @terminal.puts "Frame #{@frames + 1}: How many pins did your 2nd bowl knock down?"
        second_bowl = @terminal.gets.chomp.to_i
        @scorecard << [first_bowl, second_bowl]
       end
      @frames += 1
    end

  # Final (10th) frame
    @terminal.puts "Last frame! How many pins did your 1st bowl knock down?"
    first_bowl = @terminal.gets.chomp.to_i
    @terminal.puts "Last frame! How many pins did your 2nd bowl knock down?"
    second_bowl = @terminal.gets.chomp.to_i
    if first_bowl == 10 || first_bowl + second_bowl == 10
      @terminal.puts "Last frame! How many pins did your bonus bowl knock down?"
      bonus_bowl = @terminal.gets.chomp.to_i
      @scorecard << [first_bowl, second_bowl, bonus_bowl]
      @frames += 1
    else
      @scorecard << [first_bowl, second_bowl]
      @frames += 1
    end

    @terminal.puts "Your scorecard: #{@scorecard}" 
    @terminal.puts "Your final score: #{calculate(@scorecard)}" 
  end

  def calculate(frames)
    rounds = frames.length
    frame = 0

    while rounds > 0 do
      @score << frames[frame]
      if frame > 1 && frames[frame - 1].first == 10 && frames[frame - 2].first == 10
        @score << frames[frame].first(2)
        @score << frames[frame - 1].first(2)
      elsif frame > 0 && frames[frame - 1].first == 10
        @score << frames[frame].first(2)
      elsif frame > 0 && frames[frame - 1].sum == 10
        @score << frames[frame].first
      end
      frame += 1
      rounds -= 1
    end
    return @score.flatten.sum
  end
end
