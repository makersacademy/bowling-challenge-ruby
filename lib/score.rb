class Score
  # Create an attribute reader (read only) called count, so the user can only see their score count
  attr_reader :count, :roll_one, :roll_two

    def initialize
      # Implement count as an array, then add score in array
      @count = []
    end

    def score_count(count)
      # Sum (add together) all of the numbers in the count array and add in the new count with a count parameter
      @count.sum(count)
    end

    def spare(spare_count)
      # The score is ten plus the first roll of the next frame
      # If both rolls = 10, score = 10 + FX + 1.R1
      roll_one = 4
      spare = 10 + roll_one
    end

    # def strike
    # end

    # def tenth_frame
    # end

end