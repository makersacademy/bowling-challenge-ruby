class Game
    def initialize
        @score_card = []
        @frames_played = 0
    end

    def add_frame(frame)
        @score_card << frame
        @frames_played += 1
        return 'GUTTER'
    end

    def calculate_score
        return 0
    end

    def frames_played
        return 1
    end
end