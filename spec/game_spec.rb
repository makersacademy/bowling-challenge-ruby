require 'game'

describe Game do
  let(:game) { described_class.new }
  it 'can score a 0 in a frame' do 
    2.times { game.bowl(0) }
    expect(game.score).to eq 0 
  end
end      