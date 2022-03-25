require 'scorecard'

describe Scorecard do
  context 'when name given' do
    subject(:scorecard) { Scorecard.new('Rob') }
    describe '#start' do
      it 'outputs the player name' do
        expect { scorecard.start }.to output(a_string_including('Player: Rob')).to_stdout
      end
    end
  end

  context 'when no name given' do
    subject(:scorecard) { Scorecard.new }
    describe '#start' do
      it 'outputs no name' do
        expect { scorecard.start }.to output(a_string_including('Scorecard')).to_stdout
      end
    end
  end
end