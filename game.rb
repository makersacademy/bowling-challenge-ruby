class Game

  def initialize
    @frames = @frames = Array.new(10){ [] }
    @frame_number = 1
    @roll_number = 1
  end

  def roll(pins)
    if @frame_number < 10
      if pins < 10 && @roll_number == 1
        @frames[@frame_number -1] << pins
        @roll_number += 1
      elsif pins < 10 && @roll_number == 2
        @frames[@frame_number -1] << pins
        @frame_number += 1
        @roll_number -= 1
      else
        @frames[@frame_number -1] << pins
        @frame_number += 1
      end
    else
      @frames[9] << pins
    end
  end

  def score
    @frames.each_with_index do |frame, i|
      if strike?(frame)
        unless @frames[i + 1][1] == nil
          frame << @frames[i + 1][0]
          frame << @frames[i + 1][1]
        else
          frame << @frames[i + 1][0]
          frame << @frames[i + 2][0]
        end
      end
    end

    @frames.each_with_index do |frame, i|
      frame << @frames[i + 1][0]  if spare?(frame) 
    end
  end

  def total
    @frames.flatten.compact.sum
  end

  private

  def spare?(frame)
    !frame.include?(10) && frame.compact.sum == 10
  end

  def strike?(frame)
    frame.include?(10)
  end

end
