require_relative './lib/game.rb'
require_relative './lib/frame.rb'

class Application
    def initialize
    
    end

    def run_Game
        num = 0
        @game = Game.new

        while num < 9 do
            firstRoll
            if @frame.roll1 < 10
                secondRoll
            end
            @game.add_frame(@frame)
            num += 1
        end
    end
  
end

