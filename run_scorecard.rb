require './lib/scorecard.rb'

def take_scores
  game_finished = false
  scorecard = Scorecard.new
  while game_finished == false
    puts "Please enter the pins knocked down from the roll"
    roll = gets.chomp.to_i
    scorecard.input(roll)
    puts "The current score is #{scorecard.score}, in the #{scorecard.frames.length} frame"
    game_finished = scorecard.game_finished?
  end
  puts "All frames finished!"
end

take_scores
