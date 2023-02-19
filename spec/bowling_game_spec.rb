require "bowling_game"

RSpec.describe BowlingGame do
  before(:each) do
    @io = double :fake_io
    @frame = double :fake_frame
    allow(@frame).to receive(:new).and_return(@frame)
    @game = BowlingGame.new(@io, @frame)
  end

  context "#play" do
    it "should display a total score after each play" do
      expect(@frame).to receive(:is_ended?).and_return(false)
      expect(@frame).to receive(:add_score).with(3)
      @game.play(3)
    end

    it "should display a total score if the game ended." do
      allow(@frame).to receive(:is_ended?).and_return(false, true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false, true)
      allow(@frame).to receive(:add_score).with(5).exactly(20).times
      allow(@frame).to receive(:status).and_return("normal")
      allow(@frame).to receive(:total_score).and_return(10, 10, 10, 10, 10, 10, 10, 10, 10, 10)
      Array.new(20, 5).each do |hits|
        @game.play(hits)
      end
    end
  end
end
