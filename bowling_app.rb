require_relative './lib/game'

class BowlingApp
  def run!
    game = Game.new

    game.frames.each do |frame|
      puts "This is Frame #{frame.frame_number}"
      frame.rolls.each do |roll|
        puts 'Input your roll'
        input = gets.chomp.to_i
        roll = input
        break if roll == 10
      end
    end
  end
  # puts game.total_score
end

BowlingApp.new.run!
