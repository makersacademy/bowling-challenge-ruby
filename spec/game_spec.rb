require 'game'

describe Game do
  it 'has a max of ten frames' do
    expect(subject.total_frames).to eq 10
  end
  it 'knows how many frames have been played' do
    4.times{ subject.roll(1) }
    expect(subject.count).to eq 2
  end

  describe 'get_score' do
    it 'should be 0 for only gutter rolls' do
      20.times{ subject.roll(0) }
      expect(subject.get_score).to eq 0
    end
    it 'should return the game total score' do
      subject.roll(4)
      subject.roll(5)
      subject.roll(7)
      subject.roll(1)
      16.times{ subject.roll(1) }
      expect(subject.get_score).to eq 33
    end

    it 'should return the game total score' do
      subject.roll(10)
      subject.roll(2)
      subject.roll(4)
      16.times{ subject.roll(0) }
      expect(subject.get_score).to eq 22
    end
  end
end