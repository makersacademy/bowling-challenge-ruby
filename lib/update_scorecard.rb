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

        # checks input is correct
        if roll1 > 10
            fail 'must be under 10'
        end

        # adds spare bonus to previous frame equal to first
        # roll of current frame
        if @spare == true || @strike == true
            @player.updatePrevFrame(roll1, @currentFrame)
            @spare = false
        end

        # checks for a strike
        if roll1 == 10
            @strike = true
            @player.addFrame([10])
            # frame updates here because entry stops
            @currentFrame += 1
            return
        end

        # -------------------

        roll2 = @io.gets.chomp.to_i

        if roll2 > 9
            fail 'must be under 9'
        end

        if roll1 + roll2 > 10
            fail 'total input this frame must be 10 or under'
        end

        # check for strike and update prev frame
        if @strike == true
            @player.updatePrevFrame(roll2, @currentFrame)
            @strike = false
        end

        # check for spare
        if roll1 + roll2 == 10
            @spare = true
        end

        @player.addFrame([roll1, roll2])
        # update frame to track scoring for spares and strikes
        @currentFrame += 1

    end

end