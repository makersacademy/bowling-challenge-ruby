require 'frame'

class Game
    def initialize
        @score_card = []
        @frames_played = 0
    end

    def add_frame(frame)
        return 'START NEW GAME' if @frames_played == 10
        @score_card << frame
        @frames_played += 1
        return nil
    end

    def calculate_score
        return 0
    end

    def frames_played
        return @frames_played
    end
end