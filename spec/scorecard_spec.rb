require 'scorecard'

describe 'ScoreCard' do
  let(:subject) { ScoreCard.new }

  describe '#run' do
    it 'should update the score based on user input' do
      allow_any_instance_of(ScoreCard).to receive(:gets).and_return(9)
      expect(subject.run).to eq 9
      expect(subject.knocked_down_pins).to eq 9
    end

  end
end