# frozen_string_literal: true

# one roll in final frame

class TwelfthFrame
  attr_reader :frame_number, :roll_one, :roll_two

  def initialize
    @roll_one = nil
    @roll_two = nil
    @strike = false
    @spare = false
  end

  def run
    puts 'Frame number 12'
    puts 'Roll 1?'
    @roll_one = gets.chomp.to_i
    p @roll_one
    calculate_strike
  end

  def strike?
    @strike
  end

  def spare?
    @spare
  end

  private

  def calculate_strike
    return unless @roll_one == 10

    puts 'Strike!'
    @strike = true
  end
end
