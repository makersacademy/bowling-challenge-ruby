require 'frame'

RSpec.describe Frame do
  before(:each) do
    @io = double :io
    @frame = Frame.new(@io)
  end

  context 'format_roll method' do
    it 'formats the roll into a scoreboard format' do
      @frame.rolls = [5, 4]
      expect(@frame.format_roll).to eq '5 4'
    end

    it 'formats the roll with a spare into a scoreboard format' do
      @frame.rolls = [5, 5]
      expect(@frame.format_roll).to eq '5 /'
    end

    it 'formats the roll with a strike into a scoreboard format' do
      @frame.rolls = [10]
      expect(@frame.format_roll).to eq 'X'
    end

    it 'formats the roll with two strikes and a 5 into a scoreboard format' do
      @frame.rolls = [10, 10, 5]
      expect(@frame.format_roll).to eq 'X X 5'
    end

    it 'formats the roll with three strikes into a scoreboard format' do
      @frame.rolls = [10, 10, 10]
      expect(@frame.format_roll).to eq 'X X X'
    end
  end

  context 'pinfall_check method' do
    it 'returns a value if it is equal to or less than the remaining number of pins' do
      expect(@io).to receive(:gets).and_return('10')
      expect(@frame.pinfall_check(0)).to eq 10
    end
  end

  context 'pinfall_check method' do
    it 'asks for input again if value is more than remaining number of pins' do
      expect(@io).to receive(:gets).and_return('11')
      expect(@io).to receive(:puts).with('Please enter a value of 10 or less')
      expect(@io).to receive(:gets).and_return('9')
      expect(@frame.pinfall_check(0)).to eq 9
    end

    it "doesn't count the first roll as value if on the tenth frame and the first roll is a strike" do
      @frame.rolls = [10]
      expect(@io).to receive(:gets).and_return('10')
      expect(@frame.pinfall_check(9)).to eq 10
    end

    it "doesn't count the first two rolls for if on the tenth frame and they are both strikes" do
      @frame.rolls = [10, 10]
      expect(@io).to receive(:gets).and_return('10')
      expect(@frame.pinfall_check(9)).to eq 10
    end
  end

  context 'add_bonus_points method' do
    it 'checks for bonus_rolls and changes variables' do
      @frame.bonus_rolls = 1
      @frame.add_bonus_points(5)
      expect(@frame.bonus_rolls).to eq 0
      expect(@frame.bonus_points).to eq 5
    end
  end
end
