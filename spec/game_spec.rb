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
            10.times { game.add_frame(frame) }
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 10
        end

        it 'when trying to enter 11th frame shows a message' do
            10.times { game.add_frame(frame) }
            status = game.add_frame(frame)
            expect(status).to eq 'START NEW GAME'
            expect(game.calculate_score).to eq 0
            expect(game.frames_played).to eq 10
        end
    end

    context 'player hits some pins without strike or spare for one' do
        it 'returns correct score after one frame and gutter roll' do
            frame.roll1 = 1
            frame.roll2 = 0
            p frame
            game.add_frame(frame)
            expect(game.calculate_score).to eq 1
        end

        it 'returns correct score after one frame and no gutter rolls' do
            frame.roll1 = 7
            frame.roll2 = 2
            game.add_frame(frame)
            expect(game.calculate_score).to eq 9
        end
    end
end