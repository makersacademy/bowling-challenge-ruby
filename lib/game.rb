class Game
  def initialize(io = Kernel)
    @io = io
    @rolls = []
  end

  def start
    @io.puts "Welcome to the Bowling Game!"
    10.times do |num|
      frame = Frame.new(num+1, @io)
      @rolls << frame.roll
    end
    @rolls = @rolls.flatten
  end

  def rolls
    @rolls
  end

end