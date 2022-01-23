class Scorecard

attr_reader :frames

  def initialize(frames = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]])
    @frames = frames 
  end

  def bonus(num) # gives bonus points per particular frame when given frame index as an argument      
    return 0 if num > 8 
      if num == 8
        frame = @frames[num]
        next_frame = @frames[num+1]
        if strike?(frame: frame) && strike?(frame: next_frame)
          return 10 + next_frame[1]
        elsif strike?(frame: frame)
          return next_frame[0] + next_frame[1]
        end
      end  

    frame = @frames[num]
    next_frame = @frames[num+1]
    next_next_frame = @frames[num+2] 
    if strike?(frame: frame) && strike?(frame: next_frame)
      10 + next_next_frame[0]
    elsif strike?(frame: frame)
      next_frame[0] + next_frame[1] # don't use sum because if 10th frame has three entries, it will sum all 3 if 9th is strike
    elsif spare?(frame: frame)
      next_frame[0]
    else 
      0
    end
  end

  def frame_scores # calculates score, inc. bonus points, for every frame and returns array of 10 frames' scores
    scores = []
    @frames.each_with_index do |frame, idx|
      scores << frame.sum + bonus(idx)
    end
    scores
  end

  def perfect_game? 
    @frames == [[10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 10, 10]]
  end  

  def gutter_game? 
    @frames == [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]]
  end  

  def total_score 
    frame_scores.sum
  end
 
  def strike?(frame: ) # input an element within @frames i.e. frame: @frames[0] or @frames[1]
    frame[0] == 10
  end

  def spare?(frame: ) 
    frame[0] != 10 && frame.sum == 10 
  end
end



