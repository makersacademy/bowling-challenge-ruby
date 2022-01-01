require_relative 'bowling.rb'

class Scoreboard_Controller

  def initialize(bowling = Bowling.new)
    @bowling = bowling
    puts "Welcome to your Bowling scoreboard!"
    puts "Please input your first bowl. To check your score, type 'My Score' at any time"
    interface
  end

  def interface
    puts "You are on turn #{@bowling.turn} and roll #{@bowling.roll}"
    choice = gets.chomp
    if (1..10).include? choice.to_i || choice == "0"
      @bowling.input(choice.to_i)
      if @bowling.turn == 11
        game_over
      else
        interface
      end
    elsif choice.downcase == "my score"
      puts @bowling.my_score
      interface
    else
      puts "Invalid input! Please try again"
      interface
    end
  end

  def game_over
    puts "Your score is: #{@bowling.final_score}!"
  end
end