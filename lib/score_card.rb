class ScoreCard
    def initialize
        @frames = 0
        @score_card = []
        @frame_score = []
    end

    def frame_score_array(score)
        @frame_score << score
    end

    def score_card
        @score_card << @frame_score
        @frame_score = []
    end

    def print_total_score
        @score_card
    end

    def frames_counter
        return false if @frames == 10
        @frames += 1
    end
end



