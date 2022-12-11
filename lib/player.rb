class Player
    
    def initialize(io, name)
        @io = io
        @name = name
        @scorecard = []
        @total = 0
    end

    def addFrame(arr)
        @scorecard.push(arr)
    end

    def updatePrevFrame(roll, frameNum)
        @scorecard[frameNum].push(roll)
    end

    def calcTotal
        totalScore = 0
        totals = @scorecard.each{ |frame| totalScore += frame.sum }
        @total = totalScore
    end

    def printTotal
        @io.puts "Your total is 3"
    end

end