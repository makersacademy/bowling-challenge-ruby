class Score
  # Create an attribute reader (read only) called count, so the user can only see their score count
  attr_reader :count

    def initialize
      # Implement count as an array, then add score in array
      @count = []
    end

    def score_count(count)
      @count.sum(count)
    end

    # def spare
    # end

    # def strike
    # end

    # def tenth_frame
    # end

end