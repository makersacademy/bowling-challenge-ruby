require_relative './lib/bowling_score_sheet'

class BowlingApp
  def initialize(io, score_sheet)
    @io = io
    @score_sheet = score_sheet
  end

  def run
    while @score_sheet.complete == false
      @io.puts "Enter number of knocked down pins separated by commas (eg 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1):"
      user_input = @io.gets.chomp
      self.roll(user_input)
      print_score_sheet
      @io.puts "Total: #{self.score}"
    end

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

  def print_score_sheet
    @score_sheet.all_frames.each do |frame|
      if frame.round > 0 && frame.round <= 10
        @io.puts "Frame: #{frame.round}, scores: #{frame.score}, total score: #{frame.total_score}, notes: #{frame.status}"
      end
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
