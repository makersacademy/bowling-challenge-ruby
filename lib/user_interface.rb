class UserInterface
  def initialize(io)
    @io = io
  end
  
  def run
    @io.puts "Welcome to the 🎳 Bowling Game"
    @io.puts "I am here to keep your score!"
  end
end