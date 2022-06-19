class UserInterface
  def initialize(io, game)
    @io = io
    @game = game
  end
  
  def run
    greetings
    while @game.continue
      pin_num = get_pin_num(@game.frame, @game.roll)
      @game.roll_pin(pin_num)
    end
    show "Game 🎳 ends!"
    show_whole_game_pins
    show_game_score
  end

  private

  def greetings
    show 'Welcome to the 🎳 Bowling Game'
    show 'I am here to keep your score!'
  end

  def show(message)
    @io.puts(message)
  end

  def check_valid_number(num_string)
    @max_allowed = 10
    return true if (num_string.match? /^\d{1,2}$/) && (num_string.to_i >= 0) && (num_string.to_i <= @max_allowed)
    return false
  end

  def prompt(message)
    @io.puts(message)
    user_input = @io.gets.chomp
    while !check_valid_number(user_input)
      show "Invalid input. You can only input an integer between 0 and #{@max_allowed}."
      show message
      user_input = @io.gets.chomp
    end
    user_input.to_i
  end

  def get_pin_num(frame, roll)
    show "Frame No. #{frame}, Roll No. #{roll}"
    pin_num = prompt 'Please enter the number of knocked down pins:'
  end

  def show_whole_game_pins
    frame_num = 1
    pins_rolled = @game.pins_rolled
    pins_rolled.each { |frame|
      roll_num = 1
      frame.each {|ball|
        show "Frame No. #{frame_num}, Roll No. #{roll_num}: #{ball}"
        roll_num += 1
      }
      frame_num += 1
    }
  end

  def show_game_score
    show "Scoreboard:"

    frame_num = 0
    scores = @game.scores
    total = 0
    scores.each { |frame|
      total += frame
      show "Frame #{frame_num + 1}: #{total}"
      frame_num += 1
    }
    show "Total score: #{@game.total_score}"
  end
end
