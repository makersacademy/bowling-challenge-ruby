class Frame
  attr_accessor :frame_num, :score, :str_rep, :message
  def initialize(frame_num, score=[])
    @frame_num = frame_num
    @score = score
    @str_rep = []
    @message = ""
  end

  def add_roll(roll_score)
    @score.push(roll_score)
  end

  def str_rep(score)
    if @score[0] = 10
      @str_rep = ["", "X"]
    elsif @score.sum == 10
      @str_rep = [@score[0].to_s, "/"]
    elsif
      for i in @score
        @str_rep.push(i.to_s)
      end
    end
  end
end

class ScoreCard
  attr_accessor :frames, :frame_bonuses
  def initialize
    @frames = []
    @frame_bonuses = []
  end

  def add_frame(frame)
    @frames.push(frame)
  end

  def current_score
    frames_total = 0
    @frames.each { |frame| frames_total += frame.score.sum }
    self.gen_bonuses
    return frames_total + @frame_bonuses.sum
  end

  def gen_bonuses
    @frame_bonuses = []
    for i in 0...9
      if @frames[i].score[0] == 10
        if @frames[i+1] == nil and @frames[i].frame_num != 9
          return nil
        elsif @frames[i].frame_num == 9
          @frame_bonuses.push(@frames[i+1].score[0..1].sum)
          return nil
        elsif @frames[i+1].score[0] == 10 && @frames[i+2] != nil
          @frame_bonuses.push(10+@frames[i+2].score[0])
        else
          @frame_bonuses.push(@frames[i+1].score.sum)
        end
      elsif @frames[i].score.sum == 10
        frame_bonuses.push(@frames[i+1].score[0])
      else
        frame_bonuses.push(0)
      end
    end  
  end 
end