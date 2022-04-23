require 'scorecard'

describe Scorecard do
    scorecard = Scorecard.new
    it "Should be a scorecard" do
        expect(scorecard).to be_a(Scorecard)
    end

    it 'Should initialize with an empty scorecard array that has 10 frames' do
        expect(scorecard.scorecard).to eq []
    end
    
    it '#add_score should create a new frame and push total_score to scorecard' do
       scorecard.add_score(2,2)
       expect(scorecard.scorecard.sum).to eq 4
    end

    scorecard1 = Scorecard.new
    it '#running_total should calculate the current total score' do
        scorecard1.add_score(2,2)
        scorecard1.add_score(1,7)
        expect(scorecard1.running_total).to eq 12
    end

end