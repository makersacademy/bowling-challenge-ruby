require_relative '../lib/score.rb'

describe Score do
  let(:score){ Score.new("Sisyphus") }

  it ".name returns the players name" do
    expect(score.name).to eq "Sisyphus"
  end

  # it "initialises with an empty but structured array" do
  #   expect(Score.scores).to eq 
  # end

  context ".add_score" do
    it "returns false when score is less than 10" do
      expect(score.add_score(1, 8)).to eq false
    end

    it "returns true when score is 10" do
      expect(score.add_score(1, 10)).to eq true
    end

    it "returns true when called twice for same frame" do
      expect(score.add_score(1, 7)).to eq false
      expect(score.add_score(1, 3)).to eq true
    end

    it "score for first frame equals entered score" do
      score.add_score(1, 7)
      score.add_score(1, 3)
      # expect(score.table).to include(/(Sisyphus).*(7).*(3).*(10)/) # this will be if I have enough time to create a nice table
      expect(score.scores[1]).to eq [7, 3]
    end

    it "raises error when score is over 10" do
      expect{ score.add_score(1, 11)}.to raise_error(BadScore, "Score entered (11) is not possible. Please enter an integer value between 0 and 10.")
    end

    it "raises error when second score of frame puts the total over 10" do
      score.add_score(1, 7)
      expect{score.add_score(1, 8)}.to raise_error(BadScore, "Scores entered add up to over 10 (7 + 8 = 15)")
    end
  end

  context "tenth frame" do
    
    it "returns true when first two rolls are less than 10" do
      score.add_score(10, 3)
      expect(score.add_score(10, 4)).to eq true
    end

    it "returns false when first two rolls equal 10" do
      score.add_score(10, 3)
      expect(score.add_score(10, 7)).to eq false
    end

    it "raises error when first two rolls are greater than 10" do
      score.add_score(10, 7)
      expect{score.add_score(10, 8)}.to raise_error(BadScore, "Scores entered add up to over 10 (7 + 8 = 15)")
    end

    it "doesn't raise an error when first roll is 10" do
      score.add_score(10, 10)
      expect(score.add_score(10, 7)).to eq false
    end

    it "scores contain 3 rolls when 3 rolls are made" do
      score.add_score(10, 10)
      score.add_score(10, 9)
      score.add_score(10, 0)
      expect(score.scores[10]).to eq [10, 9, 0]
    end

    it "raises error when first score is 10, but next two rolls are less than ten but add up to more than 10" do
      score.add_score(10, 10)
      score.add_score(10, 9)
      expect{score.add_score(10, 8)}.to raise_error(BadScore, "Scores entered add up to over 10 (9 + 8 = 17)")
    end
  end

end