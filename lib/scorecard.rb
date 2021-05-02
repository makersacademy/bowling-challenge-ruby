class Scorecard
  attr_reader :scorecard, :roll, :frame

  def initialize
    @scorecard = Array.new(12) { [0,0] }
    @roll = 1
    @frame = 1
  end

  def add_score(score)
    if @roll == 1
      if score == 10 
        @scorecard[@frame - 1] = [10]
        next_frame
      else
        update_score(score)
        @roll = 2
      end
    else
      update_score(score)
      next_frame
    end
  end

  def calculate_score
    total = 0
    @scorecard[0..9].each_with_index do |score, ind|
      if strike?(score) 
        total += 10
        if strike?(@scorecard[ind+1])
          total += 10 + @scorecard[ind+2][0]
        else
          total += @scorecard[ind+1].flatten.inject(:+)
        end
      elsif spare?(score)
        total += 10 + @scorecard[ind+1][0]
      else
        total += score.inject(:+)
      end
    end
    total
  end

  private
  def update_score(score)
    @scorecard[@frame - 1][@roll - 1] = score
  end

  def next_frame
    @roll = 1
    @frame += 1
  end

  def strike?(score)
    score[0] == 10
  end
  
  def spare?(score)
    score.inject(:+) == 10
  end
end
