require 'bowling'

describe Bowling do
  context '#roll' do
    it "gets the number of pins down on one roll" do
      io = double :io

      expect(io).to receive(:puts).with("Roll 1 - number of pins down: ")
      expect(io).to receive(:gets).and_return("4")

      bowling = Bowling.new(io)
      bowling.roll(1)
    end
  end
  
  context '#frame' do
    it 'returns an array containing 10 if roll a strike' do
      io = double :io

      expect(io).to receive(:puts).with("Roll 1 - number of pins down: ")
      expect(io).to receive(:gets).and_return("10")

      bowling = Bowling.new(io)
      result = bowling.frame
      expect(result).to eq [10]
    end

    it 'returns an array of two rolls' do
      io = double :io

      expect(io).to receive(:puts).with("Roll 1 - number of pins down: ")
      expect(io).to receive(:gets).and_return("3")
      expect(io).to receive(:puts).with("Roll 2 - number of pins down: ")
      expect(io).to receive(:gets).and_return("4")

      bowling = Bowling.new(io)
      result = bowling.frame
      expect(result).to eq [3, 4]
    end

    it 'returns an array of 0s if no pins knocked down' do
      io = double :io

      expect(io).to receive(:puts).with("Roll 1 - number of pins down: ")
      expect(io).to receive(:gets).and_return("0")
      expect(io).to receive(:puts).with("Roll 2 - number of pins down: ")
      expect(io).to receive(:gets).and_return("0")

      bowling = Bowling.new(io)
      result = bowling.frame
      expect(result).to eq [0, 0]
    end
  end
end