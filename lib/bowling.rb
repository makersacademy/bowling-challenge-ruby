require_relative "frame"

class Bowling
  def initialize
    @frames = []
    @current_frame = Frame.new
  end

  def run
    until finished?
      puts "Turn # #{@frames.count + 1}"
      puts "How many pins in the first roll?"
      @current_frame.first_roll = gets.chomp.to_i

      if @current_frame.second_roll?
        puts "How many pins in the second roll?"
        @current_frame.second_roll = gets.chomp.to_i

        if @current_frame.third_roll?
          puts "How many pins in the third roll?"
          @current_frame.third_roll = gets.chomp.to_i
        end
      end
      finish_frame
      puts score
    end
  end

  def finish_frame
    @current_frame.apply_score
    @frames.last.apply_bonus(@current_frame) unless @frames.empty?
    @frames << @current_frame
    @current_frame = Frame.new(last_frame?)
  end

  def finished?
    @frames.count == 10
  end

  def last_frame?
    @frames.count == 9
  end

  def score
    result = 0
    @frames.each do |frame|
      result += frame.score
    end
    result
  end
end
