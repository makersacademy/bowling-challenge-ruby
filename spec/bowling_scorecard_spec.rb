require 'bowling_scorecard'
require 'frame'

describe BowlingScorecard do
  context 'roll method' do
    before(:each) do
      @bowling_scorecard = BowlingScorecard.new
      @frame = Frame.new
    end

    it 'adds roll to the current Frame' do
      @bowling_scorecard.roll(5, @frame)
      expect(@frame.rolls).to eq [5]
      @bowling_scorecard.roll(4, @frame)
      expect(@frame.rolls).to eq [5, 4]
    end

    it 'adds 2 to frame bonus rolls if rolling a strike' do
      @bowling_scorecard.roll(10, @frame)
      expect(@frame.bonus_rolls).to eq 2
    end

    it 'adds 1 to frame bonus rolls if rolling a spare' do
      @bowling_scorecard.roll(5, @frame)
      @bowling_scorecard.roll(5, @frame)
      expect(@frame.bonus_rolls).to eq 1
    end

    # it "decreases the previous frame's bonus_rolls in the frame array by 1 with each new roll" do
    #   @frame.bonus_rolls = 2
    #   new_frame = Frame.new
    #   @bowling_scorecard.roll(5, new_frame)
    #   expect(@frame.bonus_rolls).to eq 1
    #   @bowling_scorecard.roll(5, new_frame)
    #   expect(@frame.bonus_rolls).to eq 0
    # end
  end

  context 'frame_loop method' do
    before(:each)do
        @io = double :io
        @bowling_scorecard = BowlingScorecard.new(@io)
    end

    it 'asks for scores and then pushes a finished Frame to the frame array' do
      expect(@io).to receive(:puts).with("Enter roll 1 pinfall:")
      expect(@io).to receive(:gets).and_return("5")
      expect(@io).to receive(:puts).with("Enter roll 2 pinfall:")
      expect(@io).to receive(:gets).and_return("4")
      result = @bowling_scorecard.frame_loop
      expect(result.length).to eq 1
      expect(result.first.rolls).to eq [5, 4]
    end
  end
end
