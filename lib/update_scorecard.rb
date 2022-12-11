require 'player'

class UpdateScorecard

    def initialize(io, player)
        @io = io
        @strike = false
        @spare = false
        @currentFrame = 0
        @player = player
    end

    def getFrameScore
        roll1 = @io.gets.chomp

        roll2 = @io.gets.chomp

        @player.addFrame([roll1.to_i, roll2.to_i])
    end

end