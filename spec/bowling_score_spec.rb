require "bowling_score"

describe BowlingScore do
  before (:each) do
    @new_game = described_class.new
  end

  it "responds to the score method" do
    expect(@new_game).to respond_to(:score)
  end

  it "should contain a scorecard with 10 frames (arrays)" do
    expect(@new_game.scorecard.length).to eq 10
  end

  describe ".score" do
    it "add 1 to the scorecard when 1 pin is knocked down" do
      @new_game.score(1)
      expect(@new_game.scorecard).to include 1
    end

    it "should add 1 to the score counter when 1 pin is knocked down" do
      @new_game.score(1)
      expect(@new_game.score_counter).to eq 1
    end

    it "should return 6 when given 2 rolls (1 + 5)" do
      @new_game.score(1)
      @new_game.score(5)
      expect(@new_game.score_counter).to eq 6
    end
  end

  describe '.increment_frame' do
    it 'should add 1 to the frame_counter when called' do
      @new_game.increment_frame
      expect(@new_game.frame_number).to eq 1
    end
  end
end
