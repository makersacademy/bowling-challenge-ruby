require 'badscore_error'

class Score
  attr_reader :name, :scores

  def initialize name
    @name = name   
    init_scores()
  end

  def add_score frame, score
    # returns true if the frame should end, false if not.
    raise BadScore.new("bad_value", score) if not (0..10).to_a.include?(score)
    if frame == 10
      add_scores_10(score)
    else
      add_scores_normal(frame, score)
    end
  end

  private

  def add_scores_10 score
    if @scores[10].index(nil) == 0
      @scores[10][0] = score
      return false
    elsif @scores[10].index(nil) == 2
      raise BadScore.new("bad_sum", [@scores[10][1], score]) if (@scores[10][1] + score > 10)
      @scores[10][2] = score
      return true
    else
      if @scores[10][0] == 10
        @scores[10][1] = score
        return false
      end
      # ie. if @scores[10].index(nil) == 1 (this is implicit, but included for understandability)
      raise BadScore.new("bad_sum", [@scores[10][0], score]) if (@scores[10][0] + score > 10)
      @scores[10][1] = score
      if @scores[10][0..1].sum == 10
        return false
      elsif @scores[10][0..1].sum < 10 # again, implicit, but easier to understand
        return true
      end
    end
  end

  def add_scores_normal frame, score
    if @scores[frame].first == nil
      @scores[frame][0] = score
      return true if score == 10
      return false
    else
      raise BadScore.new("bad_sum", [@scores[frame][0], score]) if @scores[frame][0] + score > 10
      @scores[frame][1] = score
      return true
    end
  end

  def init_scores
    @scores = {10 => [nil, nil, nil]}
    (1..9).each { |i| @scores[i] = [nil, nil]}
    # @scores[10] = [nil, nil, nil]
  end
end