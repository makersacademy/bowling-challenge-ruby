class Game

  def initialize
    @frames = @frames = [[0, 6, 4], [0, 3, 5], [0, 10], [0, 10], [0, 5, 3], [0], [0], [0], [0], [0]] #Array.new(10){ [0] }
    @frame_number = 1
    @roll_number = 1
  end

  def roll(pins)
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
  end

  def score
    @frames.each_with_index do |frame, i|
      if strike?(frame)
        unless @frames[i + 1][2] == nil
          frame << @frames[i + 1][1]
          frame << @frames[i + 1][2]
        else
          frame << @frames[i + 1][1]
          frame << @frames[i + 2][1]
        end
      end
    end

    @frames.each_with_index do |frame, i|
      frame << @frames[i + 1][1]  if spare?(frame) 
    end

    @frames.flatten.inject(:+)
  end

  def spare?(frame)
    !frame.include?(10) && frame.sum == 10
  end

  def strike?(frame)
    frame.include?(10)
  end

end
