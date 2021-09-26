require 'game'

describe Game do
  it 'should provide the total score of a frame correctly' do
    game = Game.new(:roll_one, :roll_two)
    allow(game).to receive(:roll_one) { 3 }
    allow(game).to receive(:roll_two) { 6 }
    expect(game.total_of_frame).to eq(9)
  end

  it 'should determine when a spare is rolled' do
    game = Game.new(6, 4)
    expect(game.spare?).to be true
  end

  it 'should determine when a strike is rolled' do 
    game = Game.new(10, 0)
    expect(game.strike?).to be true
  end 
end
