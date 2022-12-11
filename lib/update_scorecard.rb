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
        roll1 = @io.gets.chomp.to_i

        if roll1 > 10
            fail 'must be under 10'
        end

        roll2 = @io.gets.chomp.to_i

        if roll2 > 9
            fail 'must be under 9'
        end

        if roll1 + roll2 > 10
            fail 'total input this frame must be 10 or under'
        end
        
        @player.addFrame([roll1, roll2])
    end

end