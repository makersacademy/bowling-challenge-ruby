require_relative 'lib/bowling_scoring'

class Application
  def initialize(terminal)
    @terminal = terminal
    @scorecard = []
    @frames = 0
  end

  def collect_scores
    first_nine_frames
    final_frame
    end_game
  end

  def first_nine_frames
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
  end

  def final_frame
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
  end

  def end_game
    @terminal.puts "Your scorecard: #{@scorecard}"
    scoring = BowlingScoring.new(@scorecard) 
    @terminal.puts "Your final score: #{scoring.calculate}" 
  end
end

if __FILE__ == $0
  app = Application.new(Kernel)
  app.collect_scores
end