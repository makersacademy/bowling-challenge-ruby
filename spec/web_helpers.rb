def score_strike
  game.input_score(10)
end

def score_spare
  game.input_score(7)
  game.input_score(3)
end
