require './lib/game'

RSpec.describe Game do
  it 'Returns score board with zero points.' do
    game1 = Game.new
    expect(game1.show_final_board).to eq [0,0,0,0,0]
  end
end
