require_relative "lib/frame"

class Application
  def initialize(io)
    @io = io
    @frames = []
  end

  def run
    frame_number = 1
    while frame_number <= 10
      current_score = 0
      frame = Frame.new(frame_number)
      @io.puts "Frame #{frame_number} - Roll 1:"
      frame.roll1 = get_roll(frame)
      frame.pins -= frame.roll1

      if spare_or_strike?
        @frames[-1].bonus = frame.roll1
        @frames[-1].calc_score
      end

      if last_2_strikes?
        @frames[-2].bonus += frame.roll1
        @frames[-2].calc_score
      end

      if frame.pins != 0
        @io.puts "Frame #{frame_number} - Roll 2:"
        frame.roll2 = get_roll(frame)
      end

      frame.calc_score

      @frames << frame
      @frames.each do |frame|
        current_score += frame.score
        @io.puts "Frame: #{frame.frame} - Roll 1: #{frame.roll1} - Roll 2: #{frame.roll2} - Bonus: #{frame.bonus} - Total: #{current_score}"
      end
      frame_number += 1
    end
  end

  def get_roll(frame)
    roll = @io.gets.chomp.to_i
    while !(roll <= frame.pins && roll >= 0)
      @io.puts "Please enter a valid number of pins"
      roll = @io.gets.chomp.to_i
    end
    return roll
  end

  def spare_or_strike?
    @frames.length > 0 && (@frames[-1].roll1 + @frames[-1].roll2 == 10 || @frames[-1].roll1 == 10)
  end

  def last_2_strikes?
    @frames.length >= 2 && (@frames[-2].roll1 == 10 && @frames[-1].roll1 == 10)
  end
end

if __FILE__ == $0
  app = Application.new(
    Kernel
  )
  app.run
end
