require_relative '../lib/game.rb'

describe Game do
  subject(:game) { described_class.new }
  it 'plays 10 gutter balls' do
    game_result = { frame1: [0,0], frame2: [0,0], frame3: [0,0],
                    frame4: [0,0], frame5: [0,0], frame6: [0,0],
                    frame7: [0,0], frame8: [0,0], frame9: [0,0],
                    frame10: [0,0,0]
                  }
    expect(game.score(game_result)).to eq 0
  end

  it 'keeps track of a score with no bonuses' do
    game_result = { frame1: [1,0], frame2: [1,0], frame3: [1,0],
                    frame4: [1,0], frame5: [1,0], frame6: [1,0],
                    frame7: [1,0], frame8: [1,0], frame9: [1,0],
                    frame10: [1,0,0]
                  }
    expect(game.score(game_result)).to eq 10
  end

  it 'adds a bonus for a spare' do
    game_result = { frame1: [0,0], frame2: [5,5], frame3: [3,0],
                    frame4: [0,0], frame5: [0,0], frame6: [0,0],
                    frame7: [0,0], frame8: [0,0], frame9: [0,0],
                    frame10: [0,0,0]
                  }
    expect(game.score(game_result)).to eq 16
  end

end

