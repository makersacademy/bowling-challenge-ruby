class Scorecard
  attr_accessor :scores

  def initialize(rolls)
    @rolls = rolls
    @scores = []
    create_frames
  end

  def first_ten_frames
    @scores.select { |frame| frame.number <= 10 }
  end

  private

  def create_frames
    frame_num = 1
    roll_pos = 1

    @rolls.each do |roll|
      if roll_pos == 1
        @scores << Frame.new(self, frame_num, roll)
        roll == 10 ? frame_num += 1 : roll_pos = 2
        next
      end

      @scores.last.second_roll = roll
      roll_pos = 1
      frame_num += 1
    end
  end
end
