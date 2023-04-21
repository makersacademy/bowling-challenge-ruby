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

    it "returns [10,0] if the user strikes on the first shot" do
      expect(bowl.add_frame(10,0)).to eq [10,0]
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

  context "frames method" do
    it "shows all the shots user took as an array of arrays" do
      bowl.add_frame(1,2)
      bowl.add_frame(4,5)
      bowl.add_frame(5,3)
      expect(bowl.frames).to eq [[1,2],[4,5],[5,3]]
    end
  end

  context "count scores method" do
    it "counts the score of the given frame as is if no special events happened" do
      bowl.add_frame(1,2)
      bowl.add_frame(4,5)
      expect(bowl.count_frame_score(1)).to eq 9
    end

    it "includes the bonus points awarded by a spare" do
      bowl.add_frame(4,6)
      bowl.add_frame(4,5)
      expect(bowl.count_frame_score(1)).to eq 13
    end

    it "includes the bonus points awarded by a strike" do
      bowl.add_frame(10,0)
      bowl.add_frame(4,5)
      expect(bowl.count_frame_score(1)).to eq 18
    end
  end
end