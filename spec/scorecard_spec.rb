require 'scorecard'

describe Scorecard do
  describe '#initialize' do
    it 'creates new class instance with one argument' do
      expect(Scorecard.new).to be_a(Scorecard)
      expect(Scorecard).to respond_to(:new)
    end

    it 'new class instance has expected instance variables' do
      expect(Scorecard.new.scorecard).to eq []
    end
  end
end