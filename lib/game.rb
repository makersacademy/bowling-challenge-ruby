class Game
    def initialize
        @score_card = []
    end

    def add_frame(frame)
        @score_card << frame
        return 'GUTTER'
    end

    def calculate_score
        return 0
    end
end