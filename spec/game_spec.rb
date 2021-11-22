require 'game'

describe Game do

  it 'perfect game scores 300' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('10')
    game = Game.new
    game.run_game
    expect(Scorecard.final_score).to eq 300
  end


  it 'all spares scores 190' do
    allow_any_instance_of(Frame).to receive(:first_roll).and_return('9')
    allow_any_instance_of(Frame).to receive(:second_roll).and_return('1')
    allow_any_instance_of(Frame).to receive(:third_roll).and_return('9')
    game = Game.new
    expect(game.run_game).to eq 190
  end


end
