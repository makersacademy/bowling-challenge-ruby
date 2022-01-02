require 'frame'

class Game
  MAX_FRAMES = 10

  attr_reader :score, :frames

  def initialize(frame = Frame)
    @score = 0
    @frames = []
  end

  def score
    @score = @frames.reduce(0) { |total, frame| total + frame.score }
  end

  def play
    MAX_FRAMES.times do |index|
      frame = Frame.new
      puts "Round #{index + 1}"
      puts "Enter score for Roll 1:"
      frame.set_roll1(gets.chomp.to_i)
      puts "Enter score for Roll 2:"
      frame.set_roll2(gets.chomp.to_i)
      frames << frame
      puts "Total score: #{score}"
    end
  end
end