require 'player'
describe Player do

  context 'I want to be able to knock over 10 pins in a roll' do

    it 'can roll and hit 10' do
      allow(described_class).to receive(:gets).and_return(10)
      expect(described_class.enter_roll(pins: 10,frame:  1,roll:  :first)).to eq 10
    end

    it 'user can enter a number below 10' do
      allow(described_class).to receive(:gets).and_return(0)
      expect(described_class.enter_roll(pins: 10,frame:  1,roll:  :first)).to eq 0
    end

    it 'warns user of invalid input' do
      allow(described_class).to receive(:gets).and_return(11, 2)
      expect{ described_class.enter_roll(pins: 4,frame:  1,roll:  :first) }.to output(include("Please enter a valid score from 0 to 4\n")).to_stdout
    end

  end

end