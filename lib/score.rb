class Score
  attr_reader :frames

  def initialize
    @frames = []
  end

  def process
    puts "Frame #{self.current_frame}, first bowl score:"
    @first_bowl = gets.chomp.to_i
    if @first_bowl < 10 || self.current_frame == 10
      puts "Frame #{self.current_frame}, second bowl score:"
      @second_bowl = gets.chomp.to_i
    end
    if self.current_frame == 10 && @first_bowl == 10 && @second_bowl == 10
      puts "Frame #{self.current_frame}, third bowl score:"
      @third_bowl = gets.chomp.to_i
    end
    @frames << Frame.new(self.current_frame, @first_bowl, @second_bowl, @third_bowl)
    if self.current_frame == 11
      puts "Game over! Total score: #{self.current_score_calculator}"
    else
    puts "Current score so far: #{self.current_score_calculator}"
    process
    end
  end

  def current_score_calculator
    @score = []
    @frames.each do |frame|
      previous_frame_id = frame.id - 2
      if frame.spare? == true || frame.strike? == true
        @score << 0
      else
      @score << frame.first_bowl.to_i + frame.second_bowl.to_i + frame.third_bowl.to_i
      end
      if @frames[previous_frame_id] == nil 
        return
      elsif @frames[previous_frame_id].spare? == true
        @score << 10 + frame.first_bowl.to_i
      elsif @frames[previous_frame_id].strike? == true
        even_previous_frame = previous_frame_id - 1
        if @frames[even_previous_frame].strike? == true
          @score << 20 + frame.first_bowl.to_i
        else
          @score << 10 + frame.first_bowl.to_i + frame.second_bowl.to_i
        end
      end
    end
    @score.sum
  end

  def current_frame
    if @frames.length == 0
      1
    else 
      @frames.last.id + 1
    end
  end
end
