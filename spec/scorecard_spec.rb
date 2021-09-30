require 'scorecard'

describe Scorecard do
  
  context 'initialize' do
    it 'is an instance of bowling class' do
      expect(subject).to be_an_instance_of(Scorecard)
    end

    it 'starts with a score of 0' do
      expect(subject.running_score).to eq(0)
    end

    it 'has a player associated with the scorecard' do
      expect(subject.player).to eq('Lilly')
    end
  end

end
