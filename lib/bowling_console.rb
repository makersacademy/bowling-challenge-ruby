# frozen_string_literal: true

require './lib/bowling'

class BowlingConsole
  def initialize
    @bowling = Bowling.new
  end

  def welcome
    "Welcome to the Bowling Scorecard. Let's begin"
  end

  def start_game
    welcome
    while @bowling.frame < 10
      puts "Frame: #{@bowling.frame}. Turn: #{@bowling.turn}"
      puts 'Enter how many pins you knocked down'
      pins = gets.chomp.to_i
      @bowling.input(pins)
    end
    puts 'Thanks for playing'
    puts @bowling.total_score
  end
end
