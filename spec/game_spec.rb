require 'game'

context 'initially' do
  it 'starts with empty hash' do
    io = double :io
    game = Game.new(io)

    expect(game.game_scores).to eq({
      frame_1: [], 
      frame_2: [],
      frame_3: [],
      frame_4: [],
      frame_5: [],
      frame_6: [],
      frame_7: [],
      frame_8: [],
      frame_9: [],
      frame_10: []
      })
  end
end

