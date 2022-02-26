class BowlingGame
  # perfect_game = 300
  # gutter_game = 0
  
  def initialize
    @rolls = []
    score = []
    bonus = []
    frame = 1
  end

  def roll pins
    @rolls.push pins
  end

  def score
    result = 0
    rollCounter = 0
    20.times do
      result += @rolls[rollCounter]
      rollCounter += 1
    end
    result
  end


  # if frame <= 10 && roll == 1
  #   bowl.
  #   score + bonus
  # end
  # frame + 1
end