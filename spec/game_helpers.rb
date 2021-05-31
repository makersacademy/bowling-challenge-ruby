# frozen_string_literal: true

def bowl_until_last_frame
  subject.bowl(1)
  subject.bowl(4)
  subject.bowl(4)
  subject.bowl(5)
  subject.bowl(6)
  subject.bowl(4)
  subject.bowl(5)
  subject.bowl(5)
  subject.bowl(10)
  subject.bowl(0)
  subject.bowl(1)
  subject.bowl(7)
  subject.bowl(3)
  subject.bowl(6)
  subject.bowl(4)
  subject.bowl(10)
end

def bowl_perfect_game
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
  subject.bowl(10)
end

def bowl_gutter_game
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
  subject.bowl(0)
end
