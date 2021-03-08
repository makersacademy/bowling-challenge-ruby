class BadScore < StandardError
  def initialize(type, value)
    if type == "bad_value"
      bad_value(value)
    elsif type == "bad_sum"
      bad_sum(value)
    end
    super @message
  end

  private

  def bad_sum(value)
    @message = "Scores entered add up to over 10 (#{value[0]} + #{value[1]} = #{value.sum})"
  end

  def bad_value(value)
    @message = "Score entered (#{value}) is not possible. Please enter an integer value between 0 and 10."
  end
end