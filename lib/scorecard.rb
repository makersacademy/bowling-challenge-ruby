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
    10.times do
      y = 1
      puts ":::Frame #{x}:::"
      2.times do
        puts "Enter score #{y}:"
        y += 1
      end
      x += 1
      puts " "
    end
  end
end

scorecard = Scorecard.new
scorecard.collect_scores_from_user