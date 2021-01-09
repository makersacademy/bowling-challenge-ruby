require 'game.rb'

describe Game do

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

end
