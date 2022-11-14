require_relative 'lib/bowling_scoring'

class Application
  def initialize(terminal)
    @terminal = terminal
    @scorecard = []
    @frames = 0
  end

  def bowls
    @bowl = 0
    @second_bowl = 0
  end

  def collect_scores
    first_nine_frames
    final_frame
    end_game
  end

  def first_nine_frames
    9.times do
      @terminal.puts "Frame #{@frames + 1}: How many pins did your 1st bowl knock down?"
      @bowl = @terminal.gets.chomp.to_i
      validate_bowl(@first_bowl)
      if @bowl == 10
        @scorecard << [@bowl, 0]
        valid_input = true
      else
        @terminal.puts "Frame #{@frames + 1}: How many pins did your 2nd bowl knock down?"
        @second_bowl = @terminal.gets.chomp.to_i
        validate_second_bowl(@bowl, @second_bowl)
        valid_input = true
      end
      @frames += 1
    end
  end

  def validate_bowl(bowl)
    valid_input = false
    while valid_input == false do
      if (0..10).to_a.include?(@bowl) == false
        @terminal.puts "Invalid input. Enter a number between 0 and 10:"
        @bowl = @terminal.gets.chomp.to_i
      else
        valid_input = true
      end
    end
  end

  def validate_second_bowl(bowl, second_bowl)
    valid_input = false
    while valid_input == false do
      if (0..10).to_a.include?(@second_bowl) == false
        @terminal.puts "Invalid input. Enter a number between 0 and 10:"
        @second_bowl = @terminal.gets.chomp.to_i
      elsif @bowl + @second_bowl > 10
        @terminal.puts "There were fewer than #{@second_bowl} pins after your first bowl." 
        @terminal.puts "Input a number less than #{10 - @bowl}."
        @terminal.puts "Frame #{@frames + 1}: How many pins did your 2nd bowl knock down?"
        @second_bowl = @terminal.gets.chomp.to_i
      else
        @scorecard << [@bowl, @second_bowl]
        valid_input = true
      end
    end
  end

  def final_frame
    # Final (10th) frame
    @terminal.puts "Last frame! How many pins did your 1st bowl knock down?"
    @bowl = @terminal.gets.chomp.to_i
    validate_bowl(@bowl)
    @terminal.puts "Last frame! How many pins did your 2nd bowl knock down?"
    @second_bowl = @terminal.gets.chomp.to_i
    validate_second_bowl(@bowl, @second_bowl)
    if @bowl == 10 || @bowl + @second_bowl == 10
      @terminal.puts "Last frame! How many pins did your bonus bowl knock down?"
      @bowl = @terminal.gets.chomp.to_i
      validate_bowl(@bowl)
      @scorecard.last << @bowl
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