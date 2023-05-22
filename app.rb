require_relative './lib/bowling_score_sheet'

class BowlingApp
  def initialize(io, score_sheet)
    @io = io
    @score_sheet = score_sheet
  end

  def run
    self.roll('1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,2')
    p self.score
  end

  def roll(string_of_pins)
    rolls = string_of_pins.split(',').map { |s| s.to_i }
    i = 0
    while i < rolls.length do
      @score_sheet.add_roll(rolls[i])
      i += 1
    end
  end

  def score
    @score_sheet.all_frames.sum do |frame|
      frame.round <= 10 ? frame.total_score : 0
    end
  end

end


if __FILE__ == $0
  app = BowlingApp.new(
    Kernel,
    BowlingScoreSheet.new
  )
  app.run
end
