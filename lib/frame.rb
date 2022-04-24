class Frame

    attr_reader :frame, :bowl1, :bowl2, :bowl3, :total_score

    def initialize(score1, score2, *score3)
        @bowl1 = score1
        @bowl2 = score2
        @bowl3 = score3.pop
    end

end