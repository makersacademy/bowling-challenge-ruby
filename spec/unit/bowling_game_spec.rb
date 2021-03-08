require 'bowling_game'

describe BowlingGame do
let(:game) {described_class.new}

    context 'adding to the scorecard' do
      it 'returns a score of zero' do
        game.roll(0)
        expect(game.score).to eq 0
      end
      it 'returns a gutter frame score of zero' do
        2.times {game.roll(0)}
        expect(game.score).to eq 0
      end
      it 'logs my score on a score card' do
        game.roll(2)
        game.roll(3)
        expect(game.score).to eq 5
      end
      it 'stores a gutter game' do
        20.times {game.roll(0)}
        expect(game.score).to eq 0
      end
      it 'stores a full game of twos' do
        20.times {game.roll(2)}
        expect(game.score).to eq 40
      end
      it 'scores a spare and adds a bonus on next roll' do
        2.times {game.roll(5)}
        game.roll(4)
        game.roll(0)
        expect(game.score).to eq 18
      end
      it 'scores a strike and adds a bonus on the next two rolls' do
        game.roll(10)
        game.roll(4)
        game.roll(2)
        expect(game.score).to eq 22
      end
      #this test will fail because the roll isn't an even number
    end

    context 'user inputs too many points' do
      it 'throws an error if user inputs an invalid score' do
        expect {game.roll(11)}.to raise_error "Invalid score, please try again."
      end
    end

    context 'The game is finished' do
      describe '#game_over' do
        it 'returns true if game is over' do
          21.times {game.roll(3)}
          game.roll(3)
          expect(game).to be_game_over
        end
      end
    end
end
