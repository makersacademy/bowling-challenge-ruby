class Frame
    def initialize
        @score = 0
    end

    def score
        @score
    end

    def add(throw)
        @score += throw
    end
end 