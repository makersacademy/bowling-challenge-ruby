require_relative 'bowling'

class Scoreboard
  def initialize
    @bowling = Bowling.new
  end

  def start_game
    (1..9).each do |frame|
      puts "Frame #{frame}:"
      puts "Enter the number of pins knocked down in the first roll:"
      roll1 = gets.chomp.to_i
      @bowling.roll(roll1)

      if roll1 == 10
        puts "\nSTRIKE!!!\n"
      elsif roll1 < 10
        puts "Enter the number of pins knocked down in the second roll:"
        roll2 = gets.chomp.to_i
        @bowling.roll(roll2)
        if roll2 == 10
          puts "\STRIKE!!!\n"
        elsif roll1 + roll2 == 10
          puts "\nSPARE!!!\n"
        end
      end
      puts "\nCurrent Score without bonus: #{current_score}\n"
    end

    puts "Frame 10:"
    puts "Enter the number of pins knocked down in the first roll:"
    roll1 = gets.chomp.to_i
    @bowling.roll(roll1)

    if roll1 == 10
      puts "Enter the number of pins knocked down in the second roll:"
      roll2 = gets.chomp.to_i
      @bowling.roll(roll2)

      puts "Enter the number of pins knocked down in the third roll:"
      roll3 = gets.chomp.to_i
      @bowling.roll(roll3)
    elsif roll1 < 10
      puts "Enter the number of pins knocked down in the second roll:"
      roll2 = gets.chomp.to_i
      @bowling.roll(roll2)

      if roll1 + roll2 == 10
        puts "Enter the number of pins knocked down in the third roll:"
        roll3 = gets.chomp.to_i
        @bowling.roll(roll3)
      end
    end

    puts "Total Score with bonus: #{total_score}"
  end

  private

  def current_score
    @bowling.score
  end

  def total_score
    @bowling.score
  end
end

scoreboard = Scoreboard.new
scoreboard.start_game