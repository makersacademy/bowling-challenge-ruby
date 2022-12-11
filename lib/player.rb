class Player
    
    def initialize(name)
        @name = name
        @scorecard = []
        @total = 0
    end

    def addFrame(arr)
        @scorecard.push(arr)
    end

    def calcTotal
        totalScore = 0
        totals = @scorecard.each{ |frame| totalScore += frame.sum }
        @total = totalScore
    end

end