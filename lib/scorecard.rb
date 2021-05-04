class Scorecard
  attr_reader :scorecard, :roll, :frame_number

  def initialize
    @roll = 1
    @scorecard = [{}]
    @frame_number = 1
  end

  def add_score(score)
    if @roll == 1
      if @scorecard[@frame_number - 1][:strike?] == true || @scorecard[@frame_number - 1][:spare?] == true
        @scorecard[@frame_number - 1][:total_score] += score
      end  
        
      if score == 10
        @frame = Hash.new(0)
        @frame[:strike?] = true
        @frame[:roll_1_score] += score
        @frame[:total_score] += score
        @scorecard[@frame_number] = @frame
        update_frame
        return
      end  
      @frame = Hash.new(0)
      @frame[:roll_1_score] += score
      @frame[:total_score] += score
      @scorecard[@frame_number] = @frame
      switch_rolls

    elsif @roll == 2
      if @scorecard[@frame_number - 1][:strike?] == true
        @scorecard[@frame_number - 1][:total_score] += score
      end  
      @scorecard[@frame_number][:spare?] = true if @scorecard[@frame_number][:roll_1_score] + score == 10
      @frame[:roll_2_score] += score
      @frame[:total_score] += score
      @scorecard[@frame_number] = @frame
      update_frame
    end
    @scorecard.drop(1) if @frame_number == 1 

  end

  private

  def switch_rolls
    @roll == 1 ? @roll += 1 : @roll -= 1
  end

  def update_frame
    @frame_number += 1
  end
end
