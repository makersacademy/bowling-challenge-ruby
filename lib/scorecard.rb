class Scorecard
  attr_reader :scorecard, :roll

  def initialize
    @roll = 1
    @scorecard = Array.new(10, Hash.new(0))
    @frame_number = 0
  end

  def add_score(score)
    if @roll == 1
      @scorecard[@frame_number][:roll_1_score] += score
      @scorecard[@frame_number][:total_score] += score
      switch_rolls

    elsif @roll == 2
      @scorecard[@frame_number][:roll_2_score] += score
      @scorecard[@frame_number][:total_score] += score
    end

    update_frame
  end

  private

  def switch_rolls
    @roll == 1 ? @roll += 1 : @roll -= 1
  end

  def update_frame
    @frame_number += 1
  end
end
