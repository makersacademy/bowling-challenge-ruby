# frozen_string_literal: true

def score
  @rolls = [5, 5, 6]
  @bonus = []
  @rolls.each_with_index do |roll, index|
    # p roll
    # p index
    next unless index.odd?

    @bonus << @rolls[index + 1] if roll + @rolls[index - 1] == 10
  end
  @rolls.sum + @bonus.sum
end

p score
