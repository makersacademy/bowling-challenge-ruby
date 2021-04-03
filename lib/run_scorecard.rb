require_relative 'bowling_scorecard'

class RunScorecard
  def initialize
    @scorecard = BowlingScorecard.new
  end

  def run_game
    puts "Welcome to Jack\'s Bowling Scorecard!"
    end_game = false
    until end_game
      puts 'Enter your roll....'
      x = @scorecard.enter_roll($stdin.gets.chomp.to_i)
      puts x if x.to_s.include?("Invalid score entered,")
      puts 'Current Scorecard:'
      puts @scorecard.display_scorecard
      end_game = true if x == "End Game"
    end
    puts "Final Scorecard"
    puts @scorecard.display_scorecard
    @scorecard.display_scorecard
  end
end
