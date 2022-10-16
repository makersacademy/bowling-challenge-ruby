class BowlingGame
    
    def initialize
        @score = 0
        @rolls = []
    end

    def roll(pins)
        @rolls << pins
    end

    def score()
        sum = 0
        frameIndex = 0
        10.times { 
            if isSpare(frameIndex)
                sum += 10 + spareBonus(frameIndex)
                frameIndex += 2
            elsif isStrike(frameIndex)
                sum += 10 + strikeBonus(frameIndex)
                frameIndex += 1
            else
                sum += frameScore(frameIndex)
                frameIndex += 2
            end
        }
        sum
    end

    def isSpare(frameIndex)
        @rolls.at(frameIndex) + @rolls.at(frameIndex + 1) == 10
    end

    def isStrike(frameIndex)
        @rolls.at(frameIndex) == 10
    end

    def spareBonus(frameIndex)
        @rolls.at(frameIndex + 2)
    end

    def strikeBonus(frameIndex)
        @rolls.at(frameIndex + 1) + @rolls.at(frameIndex + 2)
    end

    def frameScore(frameIndex)
        @rolls.at(frameIndex) + @rolls.at(frameIndex + 1)
    end
end 