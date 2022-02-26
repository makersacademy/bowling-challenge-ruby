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

      # User input for rolls
      puts 'Enter score for Roll 1:'
      frame.set_roll1(gets.chomp.to_i)

      unless frame.strike?
        puts 'Enter score for Roll 2:'
        frame.set_roll2(gets.chomp.to_i)
      end

      # Edge cases for multiple strikes in a row
      if frame.strike? && index.zero?
        puts 'Enter score for Roll 2:'
        frame.bonus(gets.chomp.to_i)
      end

      if frame.strike? && frames[-2]&.strike? && index != 9
        puts 'Enter score for Roll 2:'
        frame.bonus(gets.chomp.to_i)
      end

      # Round 10 bonuses
      if frame.spare? && index == 9
        puts 'Enter score for Roll 3:'
        frame.bonus(gets.chomp.to_i)
      end

      if frame.strike? && index == 9
        puts 'Enter score for Roll 2:'
        frame.set_roll2(gets.chomp.to_i)

        puts 'Enter score for Roll 3:'
        frame.bonus(gets.chomp.to_i)
      end

      # Push frame into frames array
      frames << frame

      # Add bonus to previous frame
      frames[-2].bonus(frame.roll1 + frame.roll2) if frames[-2]&.strike?

      frames[-2].bonus(frame.roll1) if frames[-2]&.spare?

      puts "\nTotal score: #{score}\n\n"
    end
  end
end
