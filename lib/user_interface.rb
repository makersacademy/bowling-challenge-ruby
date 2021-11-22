class UserInterface
  @@welcome_message = "Welcome to 10 pin Bowling.\n" + 
                      "Please select from the following options.\n" +
                      "1. Start New Game\n" +
                      "2. Quit\n"
  
  def self.welcome
    option = nil
    print(@@welcome_message)
    while option == nil 
      input = gets.chomp
      if input.to_i == 1
        option = "start"
      elsif input.to_i == 2
        puts "Goodybye"
        option ="quit"
      else
        print("Please enter a valid interger number.\n" +
              "Here are the options again.\n" +
              "1. Start New Game\n" +
              "2. Quit\n")
      end
    end
    return option
  end

  def self.start_game
    print("Please enter you name:\n")
    name = gets.chomp.to_s
    print("Hello #{name}. Let's begin a game of Bowling!\n")
    return name
  end

  def self.bowl
    print("Please input the pins knocked down this roll: ")
    roll_score = gets.chomp.to_i
  end

end


