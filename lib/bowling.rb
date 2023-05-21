class Bowling
  def initialize(io)
    @io = io
  end

  def frame
    roll_1 = roll(1)
    return [roll_1] if roll_1 == 10
    roll_2 = roll(2)
    return [roll_1, roll_2]
  end

  def roll(number)
    @io.puts "Roll #{number} - number of pins down: "
    return @io.gets.chomp.to_i
  end
end