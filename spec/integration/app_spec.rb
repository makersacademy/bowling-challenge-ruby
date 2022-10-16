require 'frame.rb'
require 'game.rb'

RSpec.describe 'integration' do
    context '#sum' do
        it 'returns a 0 if a strikeout' do
            frame_1 = Frame.new
            frame_1.roll1 = 0
            frame_1.roll2 = 0

            frame_2 = Frame.new
            frame_2.roll1 = 0
            frame_2.roll2 = 0

            game = Game.new
            game.add_frame(frame_1)
            game.add_frame(frame_2)

            expect(game.sum).to eq 0
        end
    end
end


