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
        let(:game) { game = BowlingGame.new }

        it 'allows us to obtain final game score' do
            RollMany(times = 20, pins = 0)
            expect { score = game.score }.not_to raise_error
        end

        it 'allows us to score null points' do
            RollMany(times = 20, pins = 0)
            assertScore 0
        end

        it 'allows us to score one point' do
            roll 1
            RollMany(times = 19, pins = 0)
            assertScore 1
        end

        def RollMany(times, pins)
            times.times { game.roll pins }
        end

        def roll(pins)
            game.roll 1
        end

        def assertScore(expected)
            expect(game.score).to eq(expected)
        end
    end
end