class Scorecard
  attr_reader :scorecard, :roll, :frame_number

  def initialize
    @roll = 1
    @scorecard = []
    @frame_number = 0
  end

  def add_score(score)
    if @roll == 1
      @frame = Hash.new(0)
      @frame[:roll_1_score] += score
      @frame[:total_score] += score
      @scorecard[@frame_number] = @frame

      switch_rolls

    elsif @roll == 2
      @frame[:roll_2_score] += score
      @frame[:total_score] += score
      @scorecard[@frame_number] = @frame
      update_frame
    end

  end

  private

  def switch_rolls
    @roll == 1 ? @roll += 1 : @roll -= 1
  end

  def update_frame
    @frame_number += 1
  end
end
