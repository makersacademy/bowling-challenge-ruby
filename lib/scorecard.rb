require_relative 'frame'

class Scorecard
  def initialize(io = Kernel)
    @total = 0
    @io = io
  end

  def total
    return @total
  end

  def add_scores(scores)
    scores.each do |record|
      frame = Frame.new(record)
      @total += frame.total
    end
  end

  def collect_scores_from_user
    x = 1
    game_scores = []
    10.times do
      y = 1
      @io.puts ":::Frame #{x}:::"
      frame_score = []
      2.times do
        @io.puts "Enter score #{y}:"
        score = @io.gets
        frame_score << score 
        y += 1
      end
      game_scores << Frame.new(frame_score)
      x += 1
    end
  end
end

# scorecard = Scorecard.new
# scorecard.collect_scores_from_user