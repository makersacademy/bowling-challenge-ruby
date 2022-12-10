require 'bowling'

describe Scorecard do

  context 'points' do
    it 'shows zero points overall if player has not scored any points' do
      io = double :io

      #submit 0 scores only
      20.times {expect(io).to receive(:gets).and_return("0")}

      result = Scorecard.new(io)
      result.run

      expect(result.grand_total).to eq 0
    end

    it 'shows the grand total if player has scored points (without bonuses)' do
      io = double :io

      10.times {expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:gets).and_return("5")}

      result = Scorecard.new(io)
      result.run

      expect(result.grand_total).to eq 90
    end

  end
end