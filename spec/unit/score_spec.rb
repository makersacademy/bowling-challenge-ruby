require 'score'

describe Score do
  describe '.first_bowl' do
    it 'takes an integer for the number of pins knocked down on the first bowl' do
      expect(subject.first_bowl(score: 5)).to eq(5)
    end
  end

  describe '.second_bowl' do
    it 'takes an integer for the number of pins knocked down on the second_bowl' do
      expect(subject.second_bowl(score: 5)).to eq(5)
    end
  end

  describe '.strike?' do
    it 'determines if the first bowl score is a strike' do
      subject.first_bowl(score: 10)
      expect(subject.strike?).to eq(true)
    end
  end

  describe '.spare?' do
    it 'determines if the second bowl score is a spare' do
      subject.first_bowl(score: 2)
      subject.second_bowl(score: 8)
      expect(subject.spare?).to eq(true)
    end
  end

  describe '.gutter?' do
    it 'determines if either bowl is a gutterball' do
      subject.first_bowl(score: 0)
      subject.second_bowl(score: 8)
      expect(subject.gutter?).to eq(true)
    end
  end
end

