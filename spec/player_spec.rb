require 'player'

describe Player do
  let(:player) { Player.new}

  describe '#roll' do
    it { is_expected.to respond_to(:roll).with(1).argument }
  end
  
end 
