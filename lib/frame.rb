# frozen_string_literal: true

# Runs an individual frame, asking a user for the roll results and saving them along with strike and spare information

class Frame
  attr_reader :frame_number, :roll_one, :roll_two

  def initialize(frame_number)
    @frame_number = frame_number
    @roll_one = nil
    @roll_two = nil
    @strike = false
    @spare = false
  end

  def run
    puts "Frame number #{@frame_number}"
    puts 'Roll 1?'
    @roll_one = gets.chomp.to_i
    calculate_strike
    return if strike?

    puts 'Roll 2?'
    @roll_two = gets.chomp.to_i
    calculate_spare
  end

  def strike?
    @strike
  end

  def spare?
    @spare
  end

  def total
    if @roll_two.nil?
      @roll_one
    else
      @roll_one + @roll_two
    end
  end

  private

  def calculate_strike
    return unless @roll_one == 10

    puts 'Strike!'
    @strike = true
  end

  def calculate_spare
    return unless total == 10 && @roll_one != 10

    puts 'Spare!'
    @spare = true
  end
end
