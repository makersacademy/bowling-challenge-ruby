require_relative 'frame'

class Scorecard

  attr_reader :turn, :frames

  def initialize(turn = 1)
    @turn = turn
    @frames = [Frame.new(@turn)]
  end

  def roll(number_of_pins)
    if @turn == 10 && @frames.last.complete? 
      raise "Your game is complete"
    elsif @frames.last.complete? && @turn < 10
      @turn += 1
      @frames << Frame.new(@turn)
      @frames.last.roll(number_of_pins)
    else
      @frames.last.roll(number_of_pins)
    end
  end

  def score
    @score = 0
    @frames.each_with_index do |frame, index|
      if @frames.last == frame
        p "last frame #{frame.score}"
        @score += frame.score
      elsif frame.strike?
        if @frames[index + 1].strike? && @frames.last != @frames[index + 1]
          frame.score += @frames[index + 1].total + @frames[index + 2].roll_1
          p "double strike #{frame.score}"
          @score += frame.score
        elsif @frames[index + 1].strike? && @frames.last == @frames[index + 1]
          p "double strike 9th frame #{frame.score}"
          frame.score += (@frames[index + 1].roll_1 + @frames[index + 1].roll_2)
          @score += frame.score
        else
          frame.score += @frames[index + 1].total
          p "strike #{frame.score}"
          @score += frame.score
        end
      elsif frame.spare?
        frame.score += @frames[index + 1].roll_1
        p "spare #{frame.score}"
        @score += frame.score
      else
        p "normal #{frame.score}"
        @score += frame.total
      end
    end
    @frames.each { |frame| frame.score = frame.calculate_total }
    @score
  end

end
