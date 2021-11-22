require './lib/scorecard'
require './lib/user_interface'


def run_game
  choice = UserInterface.welcome
  if choice == 'start'
    player = UserInterface.start_game
    game = ScoreCard.new_game(player)
    roll = UserInterface.bowl
    game.add_roll(roll)

  elsif choice == "quit"
    exit()
  else
    run_game
  end
end

run_game

