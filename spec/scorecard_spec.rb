require 'scorecard'

describe Scorecard do

  # before(:each) do
  # end

  let(:scorecard) { Scorecard.new }

  context 'Initialize' do
    it 'is an instance of scorecard' do
      expect(scorecard).to be_an_instance_of(Scorecard)
    end

    it 'starts with a score of 0' do
      expect(scorecard.running_score).to eq(0)
    end

    it 'has a player associated with the scorecard' do
      expect(scorecard.player).to eq('Lilly')
    end
  end

  context 'Score' do
    it 'adds two bowls together for a frame' do
      expect(scorecard.bowl(3, 4)).to eq(7)
    end

    it 'determines if bowl is a spare' do
      scorecard.bowl(5, 5)
      expect(scorecard.spare?).to be(true)
    end

    it 'determines if bowl is a strike' do
      scorecard.bowl(10)
      expect(scorecard.strike?).to be(true)
    end

    it 'totals cumulative score after each roll' do
      scorecard.bowl(3, 3)
      scorecard.bowl(4, 2)
      expect(scorecard.running_score).to eq(12)
    end
  end
end
