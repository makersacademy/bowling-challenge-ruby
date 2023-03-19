class Roll
  def initialize(number, io)
    @number = number
    @io = io
  end

  def print_number
    @io.puts "Roll #{@number}"
  end

  def ask_for_pins
    @io.puts "Insert number of pins"
  end
end


#roll = Roll.new(1, Kernel)
#roll.print_number