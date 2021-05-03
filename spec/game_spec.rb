require 'game'

describe Game do

  it { is_expected.to be_an_instance_of Game }

  describe '#gutter game' do
    it 'can roll a gutter game' do
      20.times{subject.roll(0)}
      expect(subject.score).to eq 0
    end
  end

  describe '#score a normal game' do
    it 'can produces results for a normal game' do
      20.times { subject.roll (1) }
      expect(subject.score).to eq 20
    end

    it 'can raise an error is pin inputted is higher than 10' do
      expect { subject.roll(17) }.to raise_error "Please enter roll between 1-10"
    end
  end

  describe '#spare game' do
    it 'can roll a spare' do
      subject.roll(8)
      subject.roll(2)
      subject.roll(4)
      17.times { subject.roll(0) }
      expect(subject.score).to eq 18
    end

    it 'can roll all spares in a game' do
      21.times{ subject.roll(5) }
      expect(subject.score).to eq 150
    end
  end

  describe '#strike game' do
    it 'can roll a strike' do
      subject.roll(10)
      subject.roll(5)
      subject.roll(3)
      16.times{ subject.roll(0) }
      expect(subject.score).to eq 26
    end
  end

  describe '#perfect game' do
    it 'can roll a perfect game' do
    12.times { subject.roll(10) }
    expect(subject.score).to eq 300
    end
  end

end
