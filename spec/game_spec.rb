require_relative '../lib/game.rb'

RSpec.describe do
    context '#add_frame' do
        it 'adds frames to the list' do
            frame_1 = double :frame
            frame_2 = double :frame
            game = Game.new
            game.add_frame(frame_1)
            game.add_frame(frame_2)
            expect(game.frames_all).to eq [frame_1, frame_2]
        end
    end
end