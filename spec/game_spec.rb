require 'game'

describe Game do

  it { is_expected.to be_an_instance_of Game }

  describe '#gutter game' do
    it 'can roll a gutter game' do
      20.times{subject.roll(0)}
      expect(subject.score).to eq 0
    end
  end

end
