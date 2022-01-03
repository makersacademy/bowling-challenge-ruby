# frozen_string_literal: true

require_relative './frame'

class Game
  MAX_FRAMES = 10

  attr_reader :score, :frames

  def initialize(_frame = Frame)
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

      puts 'Enter score for Roll 1:'
      frame.set_roll1(gets.chomp.to_i)

      unless frame.strike?
        puts 'Enter score for Roll 2:'
        frame.set_roll2(gets.chomp.to_i)
      end

      if frame.strike? && index == 9
        puts 'Enter score for Roll 2:'
        frame.set_roll2(gets.chomp.to_i)

        puts 'Enter score for Roll 3:'
        frame.bonus(gets.chomp.to_i)
      end

      if frame.spare? && index == 9
        puts 'Enter score for Roll 3:'
        frame.bonus(gets.chomp.to_i)
      end

      if frame.strike? && index == 9
        puts 'Enter score for Roll 2:'
        points = frame.set_roll2(gets.chomp.to_i)
        frame.bonus(points)
        
        puts 'Enter score for Roll 3:'
        frame.bonus(gets.chomp.to_i)
      end
      
      frames << frame 

      frames[-2].bonus(frame.roll1 + frame.roll2) if frames[-2] && frames[-2].strike?
        
      frames[-2].bonus(frame.roll1) if frames[-2] && frames[-2].spare?

      puts "\nTotal score: #{score}\n\n"
    end
  end
end
