require_relative "action"
class Bowling
    attr_reader :balls
    include Action

    def initialize(balls)
      @balls = balls
      @bonus = balls.last if balls.length.eql?(11)
      @strike = Proc.new { |pins| pins.nil? ? false : pins.first.eql?(10) }
      @sum = Proc.new { |pins| pins.nil? ? zero : pins.sum }
      @spare = Proc.new { |pins| pins.nil? ? false : !@strike[pins] && @sum[pins].eql?(10) }
    end
  
    def total
      total = 0
      balls.each_with_index { |pins, count| !@strike[pins] && !@spare[pins] && pins != @bonus ? total += @sum[pins] : @strike[pins] && pins != @bonus ? total += strike(pins, count) : @spare[pins] && pins != @bonus ? total += spare(pins, count) : total };total
    end
  end