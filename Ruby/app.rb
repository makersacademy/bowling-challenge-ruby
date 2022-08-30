class Application

  def initialize(io)
    @io = io
    @score = 0
  end

  def run
    @io.puts 'Welcome to ten pin bowling'

    for frame in 1..10 do
      @io.puts "Frame #{frame}"
      @io.puts "First roll:"
      first_roll = @io.gets.chomp.to_i
      @io.puts "Second roll:"
      second_roll = @io.gets.chomp.to_i
      @io.puts "You scored #{first_roll + second_roll}"
    end

  end

end

if __FILE__ == $0
  app = Bowling.new(Kernel)
  app.run
end