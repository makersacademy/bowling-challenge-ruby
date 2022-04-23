class Frame

    attr_reader :frame, :bowl1, :bowl2, :total_score

    def initialize(score1, score2)
        @bowl1 = score1
        @bowl2 = score2
        @total_score = @bowl1 + @bowl2
    end

end