require 'bowling_scorecard'
require 'frame'

RSpec.describe BowlingScorecard do
  before(:each) do
    @io = double :io
    @bowling_scorecard = BowlingScorecard.new(@io)
  end

  context 'roll method' do
    before(:each) do
      @frame = Frame.new
    end

    it 'adds roll to the current Frame' do
      expect(@io).to receive(:gets).and_return('5')
      @bowling_scorecard.roll(@frame)
      expect(@frame.rolls).to eq [5]
      expect(@io).to receive(:gets).and_return('4')
      @bowling_scorecard.roll(@frame)
      expect(@frame.rolls).to eq [5, 4]
    end

    it 'adds 2 to frame bonus rolls if rolling a strike' do
      expect(@io).to receive(:gets).and_return('10')
      @bowling_scorecard.roll(@frame)
      expect(@frame.bonus_rolls).to eq 2
    end

    it 'adds 1 to frame bonus rolls if rolling a spare' do
      expect(@io).to receive(:gets).and_return('5')
      @bowling_scorecard.roll(@frame)
      expect(@io).to receive(:gets).and_return('5')
      @bowling_scorecard.roll(@frame)
      expect(@frame.bonus_rolls).to eq 1
    end
  end

  context 'frame_loop method' do
    it 'asks for pinfall and then pushes a finished Frame to the frame array' do
      expect(@io).to receive(:puts).with('Enter roll 1 pinfall:')
      expect(@io).to receive(:gets).and_return('5')
      expect(@io).to receive(:puts).with('Enter roll 2 pinfall:')
      expect(@io).to receive(:gets).and_return('4')
      result = @bowling_scorecard.frame_loop
      expect(result.length).to eq 1
      expect(result.first.rolls).to eq [5, 4]
    end

    it 'asks for the pinfall again if the value of the roll is more than ten' do
      expect(@io).to receive(:puts).with('Enter roll 1 pinfall:')
      expect(@io).to receive(:gets).and_return('11')
      expect(@io).to receive(:puts).with('Please enter a value of 10 or less')
      expect(@io).to receive(:gets).and_return('12')
      expect(@io).to receive(:puts).with('Please enter a value of 10 or less')
      expect(@io).to receive(:gets).and_return('5')
      expect(@io).to receive(:puts).with('Enter roll 2 pinfall:')
      expect(@io).to receive(:gets).and_return('5')
      @bowling_scorecard.frame_loop
    end

    it 'asks for the pinfall again if the value of the roll is more than ten' do
      expect(@io).to receive(:puts).with('Enter roll 1 pinfall:')
      expect(@io).to receive(:gets).and_return('5')
      expect(@io).to receive(:puts).with('Enter roll 2 pinfall:')
      expect(@io).to receive(:gets).and_return('6')
      expect(@io).to receive(:puts).with('Please enter a value of 5 or less')
      expect(@io).to receive(:gets).and_return('5')
      @bowling_scorecard.frame_loop
    end
  end

  context 'print_scorecard method' do
    it 'prints the scorecard' do
      frame1 = Frame.new
      frame1.rolls = [5, 4]
      frame2 = Frame.new
      frame2.rolls = [2, 3]
      bowling_scorecard = BowlingScorecard.new(@io, [frame1, frame2])
      expect(@io).to receive(:puts).with("Frame 1")
      expect(@io).to receive(:puts).with("5 4")
      expect(@io).to receive(:puts).with("Score: 9\n")
      expect(@io).to receive(:puts).with("Frame 2")
      expect(@io).to receive(:puts).with("2 3")
      expect(@io).to receive(:puts).with("Score: 14\n")
      bowling_scorecard.print_scorecard
    end
  end



  # context 'run method' do
  #   it 'prints a scorecard after the frame' do
  #     expect(@io).to receive(:puts).with('Frame 1').ordered
  #     expect(@io).to receive(:puts).with('Enter roll 1 pinfall:').ordered
  #     expect(@io).to receive(:gets).and_return('5')
  #     expect(@io).to receive(:puts).with('Enter roll 2 pinfall:')
  #     expect(@io).to receive(:gets).and_return('4')
  #     expect(@io).to receive(:puts).with('Frame 1')
  #     expect(@io).to receive(:puts).with('5 4')
  #     expect(@io).to receive(:puts).with('Score: 9')
  #   end
  # end
end
