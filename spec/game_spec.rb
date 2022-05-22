require 'game'

describe Game do
  let(:game) { described_class.new }

  it 'user can start a new game' do

    expect(game).to be_instance_of Game

  end

  it 'can enter a frame of 2 zeros' do

    2.times { game.bowl(0) }

    expect(game.score).to eq 0

  end
end
