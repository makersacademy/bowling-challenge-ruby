require 'game.rb'

describe Game do

  it "has a score which can be accessed and starts at zero" do
    expect(subject.score).to eq(0)
  end

  describe "#frames_array" do
    it "is returns an array of FRAMES_PER_GAME frame instances that can be accessed" do
      expect(subject.frames_array.length).to eq(::Game::FRAMES_PER_GAME)
      expect(subject.frames_array[0]).to be_a(Frame)
    end
  end

  describe "self.get_roll" do
    it "returns an integer roll input by the user" do
      allow(STDIN).to receive(:gets).and_return("5")
      expect(subject.get_roll).to eq(5)
    end
  end

  # all below methods are currently not isolated from Frame class

  # describe "calculate_score" do
  #   it "returns the sum of all current frame scores from the frame array" do
  #   end
  # end

  describe "compile_scorecard" do
    it "returns an array of strings of all of the frames and their current scores" do
      expect(subject.compile_scorecard).to eq(["Frame 1: 0", "Frame 2: 0", "Frame 3: 0", "Frame 4: 0", "Frame 5: 0", "Frame 6: 0", "Frame 7: 0", "Frame 8: 0", "Frame 9: 0", "Frame 10: 0"])
    end
  end

  describe "print_scorecard" do
    it "returns an array of strings of all of the frames and their current scores" do
      expect(subject.print_scorecard).to eq("Frame 1: 0, Frame 2: 0, Frame 3: 0, Frame 4: 0, Frame 5: 0, Frame 6: 0, Frame 7: 0, Frame 8: 0, Frame 9: 0, Frame 10: 0")
    end
  end

end
