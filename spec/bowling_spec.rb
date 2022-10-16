require_relative '../lib/bowling.rb'

RSpec.describe Bowling do
  it 'returns score of 9' do
    game = Bowling.new
    game.frame(4, 5)
    expect(game.score_so_far).to eq 9
  end

  it 'increases frame_no by 1' do
    game = Bowling.new
    game.frame(4, 5)
    expect(game.frame_no).to eq 2
  end

  it 'adds double the next frame score to total score after strike' do
    game = Bowling.new
    game.frame(10, 0)
    game.frame(5, 4)
    expect(game.score_so_far).to eq 28
  end

  it 'adds double the first roll in next frame to total score after spare' do
    game = Bowling.new
    game.frame(6, 4)
    game.frame(5, 4)
    expect(game.score_so_far).to eq 24
  end
end