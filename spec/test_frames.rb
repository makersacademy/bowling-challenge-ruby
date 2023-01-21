def standard_frame(game)
  game.add(1)
  game.add(2)
end

def strike_frame(game)
  game.add(10)
end

def spare_frame(game)
  game.add(8)
  game.add(2)
end

def extra_roll(game)
  game.add(1)
end

def gutter_roll(game)
  game.add(0)
end
