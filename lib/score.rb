class Score
  # Read only attribute shots is the number of pins knocked down
  attr_reader :shots
  PIN_COUNT = 10

    def initialize
      @count = []
    end

    def score_count(shots)
      @count.sum(shots)
    end

    def spare(shots)
      # The score is ten plus the first roll of the next frame, 10 + FX + 1.R1
      PIN_COUNT + shots
    end

    # def strike
      # PIN_COUNT + shots(one and two)
    # end

    # def tenth_frame
    # end

end