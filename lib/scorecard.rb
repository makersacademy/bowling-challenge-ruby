class Scorecard
  def initialize
  end

  def calculate(scores)
    @original_scores = scores
    @scores = scores 
    calculate_strikes(@scores)
    calculate_spares(@scores)
    @scores.flatten.inject(:+)
  end

  private

  def calculate_strikes(scores)
    flattened_scores = @scores.flatten
    @scores = scores.each_with_index.map do |frame, index|
      if frame.count == 1
        flattened_index = calculate_flattened_array(index)
        frame = [flattened_scores[flattened_index] + flattened_scores[flattened_index+1] + flattened_scores[flattened_index+2]]
      else
        frame
      end
    end
    return @scores
  end

  def calculate_spares(scores)
    @scores = scores.each_with_index.map do |frame, index|
      if frame.count == 2
        if frame.inject(:+) == 10
          frame << @original_scores[index+1][0] 
        else
          frame
        end
      else
        frame
      end   
    end
    return @scores
  end

  def calculate_flattened_array(index) # This method takes the original index of the scores from where the strike takes place and returns what the index of that occurence is when the scores are flattened
    part_of_array = @scores.slice(0, index)
    @flattened_index = part_of_array.flatten.count
    return @flattened_index
  end
end
