require_relative 'scorecard'
require_relative 'frame'

class Game
  attr_reader :name, :scorecard

  def initialize
    @scorecard = Scorecard.new
  end

  def start
    enter_name
    run_scorecard
  end

  def enter_name
    puts "Welcome to the bowling scorecard, please enter your name:"
    @name = gets.chomp
  end

  def run_scorecard
    puts "\nHello #{@name}, let's begin!\n\n"
    frame_number = 1
    while frame_number < 11
      standard_frame_sequence(frame_number)
      frame_number += 1
      @scorecard.frame_score
    end
    puts "\n\nThanks for playing #{name}!\n\n"
    @scorecard.total_score
  end

  def standard_frame_sequence(frame_number)
    @scorecard.scorecard << frame = Frame.new(frame_number)
    frame.enter_bowl(1)

    if frame.bowl1 != 10 || frame_number == 10
      frame.enter_bowl(2)
    end

    if frame_number == 10 && frame.bowl1 + frame.bowl2.to_i >= 10
      frame.enter_bowl(3)
    end
  end

  private :standard_frame_sequence

end