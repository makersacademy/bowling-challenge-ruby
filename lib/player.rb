class Player
    
    def initialize(io, name)
        @io = io
        @name = name
        @scorecard = []
        @total = 0
    end

    def scorecard
        return @scorecard
    end

    def addFrame(frame)
        @scorecard.push(frame)
    end

    def updatePrevFrame(roll, frameNum)
        @scorecard[frameNum - 1].push(roll)
    end

    def calcTotal
        totalScore = 0
        totals = @scorecard.each{ |frame| totalScore += frame.sum }
        @total = totalScore
    end

    def printTotal
        @io.puts "Your total is #{@total}"
    end

end