class Scorecard
  def score(array)
    total = []
    score = 0
    frames = array.each_slice(2)
    frames.each do |x|
    score += x.sum
    total << score
    end
    total
  end
end
