require './lib/game'

RSpec.describe Game do
  it 'Returns score board with zero points.' do
    game1 = Game.new
    expect(game1.show_final_board).to eq [0,0,0,0,0]
  end

  it 'Runs a perfect game.' do
    game = Game.new
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)

    expect(game.score).to eq 300
  end

  it 'Runs an almost perfect game. Score is 271.' do
    game = Game.new
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.roll(2)
    game.roll(8)
    game.roll(9)

    expect(game.score).to eq 271
  end

  it 'Runs a low score game. Score is 167.' do
    game = Game.new
    game.roll(2)
    game.roll(5) # end of frame 1. No Spare. Accumulated = 7
    game.roll(1)
    game.roll(7) # end of frame 2. No Spare. Accumulated = 15
    game.roll(10) # strike in frame 3. Bonus = 8. Accumulated = 10 + 15 + 8 = 33
    game.roll(5)
    game.roll(3) # end of frame 4. No Spare. Accumulated = 33 + 8 = 41
    game.roll(8)
    game.roll(2) # end of frame 5. Got a spare = 10. Accumulated = 41 + 10 + 10 = 61
    game.roll(10) # strike in frame 6. Accumulated = 61 + 10 + 9 = 80
    game.roll(6)
    game.roll(3) # end of frame 6. No Spare. Accumulated = 80 + 9 = 89
    game.roll(10) # strike in frame 7. Accumulated = 89 + 10 + 10 = 109
    game.roll(10) # strike in frame 8. Accumulated = 109 + 10 + 10 = 129
    game.roll(10) # strike in frame 9. Accumulated = 129 + 10 + 8 + 2 = 149
    game.roll(8) 
    game.roll(2) # end of frame 10. Got a spare = 8. Accumulated = 149 + 10 + 8 = 167
    game.roll(8) # end 

    expect(game.score).to eq 167
  end

  xit 'Returns score board for a game with three players.' do
    # After multiplayer functionality added
  end
end
