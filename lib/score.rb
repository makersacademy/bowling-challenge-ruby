class Score
  # Create an attribute reader (read only) called count, so the user can only see their score count
  # attr_reader :count

    # Initialize the count to 0
    @@count = 0
    def initialize
      # Implement count as a global variable, so it can be used by all methods in the score class. Set as a counter
      @@count += 1
    end

    def score_count(count)
      @@count
    end

    # def spare
    # end

    # def strike
    # end

end