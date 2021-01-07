require 'scorecard'

describe 'ScoreCard' do
  let(:subject) { ScoreCard.new }

  describe '#run' do
    it 'should update the score based on user input' do
      allow_any_instance_of(ScoreCard).to receive(:gets).and_return(9)
      expect(subject.run).to eq 9
      expect(subject.first_roll).to eq 9
    end

    it 'should prompt the user for second roll result' do
      allow_any_instance_of(ScoreCard).to receive(:gets).and_return(9)
      expect_any_instance_of(ScoreCard).to receive(:gets).twice
      subject.run
    end

    it 'should skip the second roll if first roll was a strike' do
      allow_any_instance_of(ScoreCard).to receive(:gets).and_return(10)
      expect(subject.second_roll).to be nil
    end

    it 'should run the rounds 10 times' do
      
    end
  end

  it 'should count the number of frames' do
    expect(subject.frames).to eq 10
  end
end