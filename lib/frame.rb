class Frame
  def initialize(number, io)
    @number = number
    @io = io
  end

  def print_number
    @io.puts "Frame #{@number}"
  end
end


#frame = Frame.new(2, Kernel)
#frame.print_number