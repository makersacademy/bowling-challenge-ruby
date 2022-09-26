require_relative './lib/game'

# Initialises game.rb with arguments
if __FILE__ == $0
  app = Game.new(
    Kernel,
    Scorecard.new
  )
  app.run
end