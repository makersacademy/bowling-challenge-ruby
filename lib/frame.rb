# frozen_string_literal: true

class Frame
  def initialize
    @final = []
  end

  def result(first_roll, second_roll)
    @final << first_roll
    @final << if first_roll == 10
                0
              else
                second_roll
              end
    @final
  end

  def strike?
    @final.first == 10
  end

  def spare?
    !strike? && @final.sum == 10
  end

  attr_reader :final
end
