require_relative "lib/game"
require_relative "lib/score_sheet"

game = Game.new
score_sheet = ScoreSheet.new(game)

until game.complete?
  print "Input your roll here - "
  roll = gets.chomp.to_i
  game.add_roll(roll)
end

puts
score_sheet.print
