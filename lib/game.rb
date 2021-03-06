class Game
    def initialize
        @score = 0
    end

    def score
        @score
    end

    def add(frame_score)
        @score += frame_score
    end
end