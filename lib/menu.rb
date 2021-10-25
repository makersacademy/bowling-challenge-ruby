require_relative 'bowling'

class Menu

  def initialize
    @bowling = Bowling.new
  end

  def welcome
    puts ''
    puts 'BOWLING SCORECARD'
    puts '----------'
    puts 'Welcome, happy bowling!'
    puts ''
  end

  def interactive_menu
    loop do
      print_menu
      puts ''
      puts 'Please enter a number from the menu.'
      process(gets.chomp)
      puts ''
    end
  end

  def print_menu
    puts ''
    puts 'MENU'
    puts '----------'
    puts '1. Input number of players'
    puts '2. Input player names'
    puts '3. Change player names'
    puts '4. Start a scorecard'
    puts '5. Exit scorecard program'
    # puts '6. Save the scorecard to sscorecard.csv'
    # puts '7. Load the scorecard from scorecard.csv'
    # puts '8. Leaderboard'
  end

  def process(selection)
    case selection
    when '1'
      @bowling.players.input_number
    when '2'
      @bowling.players.input_names
      puts ''
      @bowling.players.list
    when '3'
      @bowling.players.input_names
      puts ''
      @bowling.players.list
    when '4'
      @bowling.start_game
    when '5'
      exit # this will cause the program to terminate
    # when '6'
    #   save_scorecard
    # when '7'
    #   load_scorecard
    # when '8'
    #   leaderboard
    else
      puts 'Invalid entry, try again'
    end
  end

end

# This is where the whole app is actually run.
app = Menu.new
app.welcome
app.interactive_menu
