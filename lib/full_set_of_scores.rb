class Finished

  attr_reader :totals
  attr_accessor :scores

  def initialize
    @totals = []
    @scores = []
    @frame_number = 1
  end

  def calculate(scores = @scores)
    scores.each_with_index do |frame, index|
      if frame.sum < 10
        @totals[index] = frame.sum
      elsif frame[0] == 10
        @totals[index] = strike(index)
      else
        @totals[index] = 10 + scores[index+1][0]
      end
    end
  end

  def strike(index)
    if @scores[index+1][0] == 10
      20 + @scores[index+2][0]
    else
      10 + @scores[index+1].sum
    end
  end

  def get_frame
    puts "Frame #{@frame_number}, Roll 1:"
    roll1 = gets.chomp
    puts "Frame #{@frame_number}, Roll 2:"
    roll2 = gets.chomp
    @scores << [roll1, roll2]
  end

end
