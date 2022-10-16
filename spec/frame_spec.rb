require_relative '../lib/game.rb'

RSpec.describe Frame do
    context '#total' do
        it 'returns sum of rolls' do
            frame = Frame.new
            frame.roll1 = 2
            frame.roll2 = 4
            expect(frame.total).to eq 6
        end
    end
end