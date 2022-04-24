require_relative 'badscore_error'

class Score
  attr_reader :name, :scores

  def initialize name = 'Sisyphus'
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

  def total
    # cum_score == cumulative score, but I didn't want to keep typing out such a big variable name. the rest is serendipity
    scores = remove_nil() # remove_nil turns scores into an array
    # puts "numeric scores: #{scores}"
    scores.length == 10 ? cum_score = scores[9].sum : cum_score = 0 # start with the score for the 10th frame, or 0 if the 10th frame doesn't exist yet
    # puts "cum_score: #{cum_score}"
    (0...[9, scores.length -  1].max).each do |i| # 1st to 9th frames. gotta love 0 index lol. also, (0...9) is a range of numbers ending with 8
      frame = scores[i]
      cum_score += frame.sum
      if frame[0] == 10
        cum_score += strike(scores, i)
      elsif frame.sum == 10
        cum_score += spare(scores, i)
      end
      # puts "cum_score#{i + 1}: #{cum_score - 16}"
    end
    return cum_score
  end


  private

  def strike(scores, i)
    # [[10], [4, 5]].flatten returns [10, 4, 5]
    scores[(i + 1)..].flatten[0..1].sum # take the scores from the next frame till the end, flatten the scores array, and take the next 2 
  end

  def spare(scores, i)
    scores[(i + 1)..].flatten[0] # same as strike, except it takes the next score instead of the next 2
  end
  
  def remove_nil
    numeric_scores = []
    (1..10).each do |n|
      filtered_frame = @scores[n].filter_map{ |v| v if v != nil }
      numeric_scores << filtered_frame unless filtered_frame == nil
    end
    return numeric_scores
  end

  def add_scores_10 score
    # puts @scores
    if @scores[10].index(nil) == 0 # entering the first roll of frame 10
      @scores[10][0] = score
      return false
    elsif @scores[10].index(nil) == 2 # entering the last roll of frame 10

      if (@scores[10][1] + score > 10) and (@scores[10][0] == 10) and (@scores[10][1] != 10)
        # if (the second and      )   and   ( the first score  ) and  ( the second score )
        #    (third scores add up )   also  (  equals 10       ) also ( doesn't equal 10)
        #    ( to more than 10    )
        # so basically [10, 9, 2] will raise an error, but [8, 2, 9] and [10, 10, 4] won't
        raise BadScore.new("bad_sum", [@scores[10][1], score])
      end

      @scores[10][2] = score
      return true
    else                        # entering the second roll of frame 10
      if @scores[10][0] == 10
        @scores[10][1] = score
        return false
      end

      raise BadScore.new("bad_sum", [@scores[10][0], score]) if (@scores[10][0] + score > 10)
      
      @scores[10][1] = score
      
      if @scores[10][0..1].sum == 10
        return false
      elsif @scores[10][0..1].sum < 10 # this is implicit, but written explicitly for understandability
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