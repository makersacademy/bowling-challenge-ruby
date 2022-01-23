require 'bowling'

describe Bowling do
  let(:bowling) { Bowling.new}

  describe 'play' do
    it 'returns game has started' do
      expect(bowling.play).to eq 'The game has started'
    end
  end
end

