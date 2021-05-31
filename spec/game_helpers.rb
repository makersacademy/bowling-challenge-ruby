# frozen_string_literal: true

def bowl_until_last_frame
  rolls = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10]
  rolls.each do |roll|
    subject.bowl(roll)
  end
end

def bowl_perfect_game
  11.times do
    subject.bowl(10)
  end
  subject.bowl(10)
end

def bowl_gutter_game
  19.times do
    subject.bowl(0)
  end
  subject.bowl(0)
end
