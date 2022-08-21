class UserInterface
  def intiialize(io)
    @io = io
  end

  def run
    @io.puts "Welcome to your bowling scorecard!"
    @io.puts "Please enter your score for each frame"
end