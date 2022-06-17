class UserInterface
  def initialize(io)
    @io = io
  end
  
  def run
    show "Welcome to the 🎳 Bowling Game"
    show "I am here to keep your score!"
  end

  private

  def show(message)
    @io.puts(message)
  end

end