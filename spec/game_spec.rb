require 'game'

describe Game do
  
  it 'perfect game scores 300' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('10')
    game = Game.new
    expect(game.run_game).to eq 300
  end

end
