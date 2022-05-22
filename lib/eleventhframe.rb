# frozen_string_literal: true

class EleventhFrame
  attr_reader :frame_number, :roll_one, :roll_two

  def initialize(frame_10_spare)
    @frame_10_spare = frame_10_spare
    @roll_one = nil
    @roll_two = nil
    @strike = false
    @spare = false
  end

  def run
    puts "Frame number 11"
    puts 'Roll 1?'
    @roll_one = gets.chomp.to_i
    p @roll_one
    calculate_strike
    return if @frame_10_spare == true
    puts 'Roll 2?'
    @roll_two = gets.chomp.to_i
    p @roll_two
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
