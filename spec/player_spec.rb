require './lib/player'

RSpec.describe Player do
  it 'Creates a player.' do
    player1 = Player.new
    expect(player1.create_player('Paul','Lazar')).to eq 'Paul Lazar'
  end
end