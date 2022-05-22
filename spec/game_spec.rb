require 'game'

describe Game do
  let(:game) { described_class.new }

  it 'user can start a new game' do

    expect(game).to be_instance_of Game

  end

end
