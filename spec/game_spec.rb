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

end