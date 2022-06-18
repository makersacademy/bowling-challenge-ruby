class UserInterface
  def initialize(io, game)
    @io = io
    @game = game
  end
  
  def run
    show 'Welcome to the 🎳 Bowling Game'
    show 'I am here to keep your score!'
    show "Frame No. #{@game.frame}, Roll No. #{@game.roll}"
    pin_num = prompt 'Please enter the number of knocked down pins:'
    show pin_num 
  end

  private

  def show(message)
    @io.puts(message)
  end

  def check_valid_number(num_string)
    return true if (num_string.match? /^\d{1,2}$/) && (num_string.to_i >= 0) && (num_string.to_i <= 10)
    return false
  end

  def prompt(message)
    @io.puts(message)
    user_input = @io.gets.chomp
    while !check_valid_number(user_input)
      show "Invalid input. You can only input an integer between 0 and 10."
      show message
      user_input = @io.gets.chomp
    end
    user_input.to_i
  end

end
