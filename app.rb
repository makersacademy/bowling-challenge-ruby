require_relative './lib/scoreboard'
require_relative './lib/frame'
require_relative './lib/player'
puts "---------------------------------------------------"
puts "  ---- BOWLING SCORECARD ------------------------"
puts "    -------------------------------------------"
puts ""
puts "Enter player name:"
name = gets.chomp
scoreboard = Scoreboard.new(name, Kernel)

puts "Let's bowl, #{scoreboard.player.name}!"
scoreboard.play_game

score = scoreboard.game_result
puts "#{scoreboard.player.name}'s total score: #{score}"