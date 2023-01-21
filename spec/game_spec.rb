require 'game'

describe Game do
    context 'player hits zero pins in every frame' do
        it 'after one frame shows total points as zero' do
            game = Game.new
            game.add_frame([0, 0])
            score = game.calculate_score
            expect(score).to eq 0
            expect(game.frames_played).to eq 1
        end

        it 'after 9 frames shows total points as zero' do
            game = Game.new
            9.times { game.add_frame([0, 0]) }
            score = game.calculate_score
            expect(score).to eq 0
            expect(game.frames_played).to eq 9
        end
        
        it 'after 10 frames shows total points as zero' do
            game = Game.new
            10.times { game.add_frame([0, 0]) }
            score = game.calculate_score
            expect(score).to eq 0
            expect(game.frames_played).to eq 10
        end

        it 'when trying to enter 11th frame shows a message' do
            game = Game.new
            10.times { game.add_frame([0, 0]) }
            status = game.add_frame([0, 0])
            expect(status).to eq 'START NEW GAME'
            score = game.calculate_score
            expect(score).to eq 0
            expect(game.frames_played).to eq 10
        end
    end
end