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

  it 'should start with a default frame number of 1' do
    expect(@new_game.frame_number).to eq 1
  end

  describe '.capture_pins' do
    it 'should accept a user input and save to variable' do
      allow($stdin).to receive(:gets).and_return(1)
      pins = $stdin.gets
      expect(pins).to eq 1
    end
  end

  describe ".add_pins_to_frame" do
    it "add 1 to the first frame scorecard when 1 pin is knocked down" do
      @new_game.add_pins_to_frame(1)
      expect(@new_game.scorecard[0]).to include 1
    end
  end

  describe ".score" do
    it "should add 1 to the score counter when 1 pin is knocked down" do
      @new_game.score(1)
      expect(@new_game.gamescore).to eq 1
    end

    it "should return 6 when given 2 rolls (1 + 5)" do
      @new_game.score(1)
      @new_game.score(5)
      expect(@new_game.gamescore).to eq 6
    end
  end

  describe '.increment_frame' do
    it 'should add 1 to the frame_counter when called' do
      @new_game.increment_frame
      expect(@new_game.frame_number).to eq 2
    end
  end

  describe '.frame_complete?' do
    it 'should return true if the frame is complete' do
      @new_game.add_pins_to_frame(1)
      @new_game.add_pins_to_frame(2)
      expect(@new_game.frame_complete?).to eq true
    end

    it 'should return false if the frame is incomplete' do
      @new_game.add_pins_to_frame(1)
      expect(@new_game.frame_complete?).to eq false
    end
  end
end
