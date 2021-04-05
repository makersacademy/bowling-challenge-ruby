# frozen_string_literal: true

require_relative './frame'

class Bowling
  attr_reader :total_score

  def initialize(input: $stdin, output: $stdout)
    @frames = []
    @total_score = 0
    @input = input
    @output = output
  end

  def play
    (1..10).each do |i|
      @current_frame = Frame.new
      2.times { game_roll }
      process_frame(i)
      p @current_frame.result unless @current_frame.result.empty?
    end
    p "total score: #{@total_score}"
  end

  private

  def game_roll(bonus = false)
    pins_left = bonus ? 10 : @current_frame.pins_left
    return unless pins_left.positive?

    pins = input_roll_pins(pins_left)
    @current_frame.roll(pins, bonus)
  end

  def bonus_roll
    game_roll(true) if @current_frame.result == 'Spare'
    2.times { game_roll(true) } if @current_frame.result == 'Strike'
  end

  def input_roll_pins(max_pins)
    pins = 0
    @current_frame ||= Frame.new
    puts "Frame #{@frames.length + 1} Roll #{@current_frame.rolls.length + 1}: enter how many pins to knock, 0-#{max_pins}:"
    loop do
      pins = @input.gets.chomp.to_i
      break if pins >= 0 && pins <= max_pins

      @output.puts 'Invalid. Try again:'
    end
    pins
  end

  def process_frame(frame_no)
    bonus_roll if frame_no == 10
    adjust_prev_frame_score
    adjust_prev_prev_frame_score
    @frames << @current_frame
    @total_score += @current_frame.score
  end

  def adjust_prev_frame_score
    return if @frames.empty?

    prev_frame_add_score = 0
    if @frames[-1].result == 'Strike'
      prev_frame_add_score = (@current_frame.rolls.length < 2 ? @current_frame.score : (@current_frame.rolls[0].knocked_pins + @current_frame.rolls[1].knocked_pins))
    end
    if @frames[-1].result == 'Spare'
      prev_frame_add_score = @current_frame.rolls[0].knocked_pins
    end
    @frames[-1].add_score(prev_frame_add_score)
    @total_score += prev_frame_add_score
  end

  def adjust_prev_prev_frame_score
    return if @frames.length < 2

    prev_prev_frame_add_score = 0
    if @frames[-1].result == 'Strike' && @frames[-2].result == 'Strike'
      prev_prev_frame_add_score = @current_frame.rolls[0].knocked_pins
    end
    @frames[-2].add_score(prev_prev_frame_add_score)
    @total_score += prev_prev_frame_add_score
  end
end
