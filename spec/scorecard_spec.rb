require 'scorecard'

describe Scorecard do
    scorecard = Scorecard.new
    it "Should be a scorecard" do
        expect(scorecard).to be_a(Scorecard)
    end

    it 'Should initialize with an empty scorecard array that has 10 frames' do
        expect(scorecard.scorecard).to eq []
    end
    
    scorecard1 = Scorecard.new
    it '#add_score return "Game is over! message when 10 rounds is complete' do
        9.times do scorecard1.add_score(2,3) end
        scorecard1.add_score(3,3,3)
        expect(scorecard1.add_score(1,2)).to eq("Game is over! You score #{scorecard1.running_total}")
    end

    scorecard2 = Scorecard.new
    it '#running_total should calculate the current total score' do
        scorecard2.add_score(2,2)
        scorecard2.add_score(1,7)
        expect(scorecard2.running_total).to eq 12
    end

    scorecard3 = Scorecard.new
    it '#strike_points should account for strikes' do
        scorecard3.add_score(10,0)
        scorecard3.add_score(4,3)
        scorecard3.add_score(4,3)
        expect(scorecard3.strike_points).to eq 7
    end

    scorecard4 = Scorecard.new
    it '#running_total should take into account strike bonuses' do
        scorecard4.add_score(10,0)
        scorecard4.add_score(4,3)
        scorecard4.add_score(4,3)
        expect(scorecard4.running_total).to eq 24
    end

    scorecard5 = Scorecard.new
    it '#running_total should take into account spare bonuses' do
        scorecard5.add_score(1,9)
        scorecard5.add_score(5,0)
        expect(scorecard5.running_total).to eq 20
    end
end