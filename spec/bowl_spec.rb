require 'bowl'

describe BowlingScorer do
  let(:bowl) {BowlingScorer.new}

  before(:each) do
    bowl.reset_scores_and_frames
  end

  context "add_frame method" do  
    it "fails if user tries to knock more than 10 in one frame" do
      expect{bowl.add_frame(6,5)}.to raise_error "Looks like you hit the next lane or something, cant knock more than 10"
    end

    it "fails if user inputs negative numbers" do
      expect{bowl.add_frame(-1,5)}.to raise_error "Smells like invalid input"
    end

    it "fails if user inputs negative numbers" do
      expect{bowl.add_frame(4,-5)}.to raise_error "Smells like invalid input"
    end

    it "returns the current frame in an array of numbers" do
      expect(bowl.add_frame(4,3)).to eq [4,3]
    end
  end

  context "check_for_spares method" do
    it "returns normal if the total input is <10 and >0" do
      expect(bowl.check_for_specials([1,4])).to eq "normal"
    end

    it "returns gutter if the total input is 0" do
      expect(bowl.check_for_specials([0,0])).to eq "gutter"
    end

    it "returns strike if the first shot is 10" do
      expect(bowl.check_for_specials([10,0])).to eq "strike"
    end

    it "returns spare if the total input is 10" do
      expect(bowl.check_for_specials([3,7])).to eq "spare"
    end

    it "returns spare if the total input is 10" do
      expect(bowl.check_for_specials([0,10])).to eq "spare"
    end
  end
end