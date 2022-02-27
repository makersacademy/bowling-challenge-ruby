require_relative '../lib/game.rb'

describe Game do
  subject(:game) { described_class.new }
  it 'plays 10 gutter balls' do
    game_result = [ [0,0], [0,0], [0,0],
                    [0,0], [0,0], [0,0],
                    [0,0], [0,0], [0,0],
                    [0,0,0]
                  ]
    expect(game.score(game_result)).to eq 0
  end

  it 'keeps track of a score with no bonuses' do
    game_result = [ [1,0], [1,0], [1,0],
                    [1,0], [1,0], [1,0],
                    [1,0], [1,0], [1,0],
                    [1,0,0]
                  ]
    expect(game.score(game_result)).to eq 10
  end

  it 'adds a bonus for a spare' do
    game_result = [ [0,0], [5,5], [3,0],
                    [0,0], [0,0], [0,0],
                    [0,0], [0,0], [0,0],
                    [0,0,0]
  ]
    expect(game.score(game_result)).to eq (5 + 5 + 3) + 3
  end

  it 'adds a bonus 2 consequetive spares' do
    game_result = [ [0,0], [5,5], [3,7],
                    [3,0], [0,0], [0,0],
                    [0,0], [0,0], [0,0],
                    [0,0,0]
  ]
    expect(game.score(game_result)).to eq (5 + 5 + 3) + (3 + 7 + 3) + 3
  end

  it 'adds a bonus for a strike' do
    game_result = [ [0,0], [10,0], [3,5],
                  [0,0], [0,0], [0,0],
                  [0,0], [0,0], [0,0],
                  [0,0,0]
  ]
    expect(game.score(game_result)).to eq (10 + 0 + 3 + 5) + 3 + 5

  end

  it 'checks 3 strikes in a row' do
    game_result = [ [10,0], [10,0], [10,0],
                  [0,0] ]
    expect(game.score(game_result)).to eq (10 + 0 + 10) + (10 + 0 + 10) + (10 + 0 + 0)

  end

  xit 'totals a spare on the final frame' do
    game_result = [ [5, 5, 3] ]
    expect(game.score(game_result)).to eq (5 + 5 + 3) + 3
  end

  xit 'scores a perfect game' do
    game_result = [ [10,0], [10,0], [10,0],
                  [10,0], [10,0], [10,0],
                  [10,0], [10,0], [10,0],
                  [10,10,10]
  ]
    expect(game.score(game_result)).to eq 300
  end

end

