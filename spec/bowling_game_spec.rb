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
            rollMany(times = 20, pins = 0)
            expect { score = game.score }.not_to raise_error
        end

        it 'allows us to score null points' do
            rollMany(times = 20, pins = 0)
            assertScore 0
        end

        it 'allows us to score one point' do
            roll 1
            rollMany(times = 19, pins = 0)
            assertScore 1
        end

        it 'allows us to score a spare game' do
            rollSpare
            roll 3
            rollMany(times = 17, pins = 0)
            assertScore 12
        end

        it 'allows us to score a strike game' do
            rollStrike
            roll 9
            roll 3
            rollMany(times = 17, pins = 0)
            assertScore 34
        end

        def rollMany(times, pins)
            times.times { game.roll pins }
        end

        def roll(pins)
            game.roll pins
        end

        def assertScore(expected)
            expect(game.score).to eq(expected)
        end

        def rollSpare
            roll 2
            roll 7
        end

        def rollStrike
            roll 10
        end
    end
end