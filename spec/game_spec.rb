require_relative '../lib/game'

describe Game do
  describe '#initialize' do
    it 'should initialize with empty scores array' do
      expect(subject.scores).to eq([])
    end
  end
end