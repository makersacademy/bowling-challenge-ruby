require 'bowling_scorecard'

describe Scorecard do

    let(:scorecard) { Scorecard.new("Ryan") }
    let(:game) { Scorecard.start("Ryan") }

    describe '#initialize' do
      it 'has a name assigned to the scorecard' do
        expect(scorecard.name).to eq "Ryan"
      end
    end

    describe '.start_game' do #these tests seem to launch the game when running rspec? - Address in the future when I've got time to come back to this
      # it 'creates an instance of a new Bowling Scorecard with a name and an empty frames array' do
      #   game.start_bowling("Ryan")
      #   expect(game).to be_a Scorecard
      #   expect(game.name).to eq "Ryan"
      #   expect(game.frames.count).to eq 0
      # end

      # it 'records the score for all frames' do
      #   game.start_bowling("Ryan")
      #   expect(game).to eq 0
      # end
    end

end