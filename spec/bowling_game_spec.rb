require 'bowling_game'

describe 'bowling game' do

    context 'starting game' do
        it 'allows us to start a game' do
            expect { game = BowlingGame.new }.not_to raise_error
        end

        it 'allows us to input roll data each time a player rolls' do
            game = BowlingGame.new
            expect { game.roll 0 }.not_to raise_error
        end
    end

    context 'completed game' do
        it 'allows us to obtain game score' do
            game = BowlingGame.new
            20.times { game.roll 0 }
            expect { score = game.score }.not_to raise_error
        end
    end
end