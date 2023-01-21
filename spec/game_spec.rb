require 'game'

describe Game do
    let(:game) { Game.new }
    let(:frame) { Frame.new }

    context 'player hits zero pins in every frame' do
        before do
            frame.roll1 = 0
            frame.roll2 = 0
        end

        it 'after one frame shows total points as zero' do
            game.add_frame(frame)
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 1
        end

        it 'after 9 frames shows total points as zero' do
            9.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 9
        end

        it 'after 10 frames shows total points as zero' do
            10.times { game.add_frame([0, 0]) }
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 10
        end

        it 'when trying to enter 11th frame shows a message' do
            10.times { game.add_frame([0, 0]) }
            status = game.add_frame([0, 0])
            expect(status).to eq 'START NEW GAME'
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 10
        end
    end
end