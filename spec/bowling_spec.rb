require 'bowling'

describe Bowling do
  before do
    @bowling = Bowling.new
  end
  describe '#enter_score' do
    context 'Player enters a score outside of 0 to 10'
    it 'returns an error' do
      expect{@bowling.enter_score(11)}.to raise_error 'Outside of Range'
    end
    context 'Player enters a valid score'
    it 'is stored as a score' do
      @bowling.enter_score(8)
      expect(@bowling.score.first).to eq 8
    end
  end
  describe '#game' do
    it 'Stops after 10 Frames' do
      10.times do 
        @bowling.enter_score(6)
      end
      expect(@bowling.score.length).to eq 10
    end
  end
  describe '#total_score' do
    it 'returns the total score as a string' do
      5.times do
        @bowling.enter_score(7)
      end
      expect(@bowling.total_score).to eq 'TOTAL: 35'
    end
  end
  describe '#valid_score?' do
    context 'A value outside of 0 to 10 is entered'
    it 'returns false' do
      expect(@bowling.valid_score?(12)).to be_falsey
    end
    context 'A value inside of 0 to 10 is entered'
    it 'returns true' do
      expect(@bowling.valid_score?(3)).to be_truthy
    end
  end
  describe '#strike?' do
    it 'returns true if you knock down 10 pins' do
      expect(@bowling.strike?(10)).to eq true
    end
  end
end