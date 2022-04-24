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
        expect(scorecard1.add_score(1,2)).to include("Game is over!")
    end


    scorecard3 = Scorecard.new
    it '#strike_points should account for strikes' do
        scorecard3.add_score(10,0)
        scorecard3.add_score(4,3)
        scorecard3.add_score(4,3)
        expect(scorecard3.strike_points).to eq 7
    end

    scorecard6 = Scorecard.new
    it 'should return a perfect game' do
        9.times do scorecard6.add_score(10,0) end
        expect(scorecard6.add_score(10,10,10)).to eq "Game is over! You scored a perfect 300!"
    end

    scorecard7 = Scorecard.new
    it 'should return 150 from all spare game' do
        9.times do scorecard7.add_score(5,5) end
        expect(scorecard7.add_score(5,5,5)).to eq "Game is over! You scored 150!"
    end

    scorecard8 = Scorecard.new
    it 'should return gutter game' do
        9.times do scorecard8.add_score(0,0) end
        expect(scorecard8.add_score(0,0)).to eq "Game is over! You scored 0! Gutter game!"
    end

    scorecard9 = Scorecard.new
    it 'should return a game with a mixture of spares, strikes and other bowls' do
        scorecard9.add_score(2,0)
        scorecard9.add_score(10,0)
        scorecard9.add_score(7,0)
        scorecard9.add_score(10,0)
        scorecard9.add_score(5,5)
        scorecard9.add_score(2,0)
        scorecard9.add_score(10,0)
        scorecard9.add_score(0,8)
        scorecard9.add_score(9,0)
        expect(scorecard9.add_score(5,5,5)).to eq "Game is over! You scored 110!"
    end

    scorecard10 = Scorecard.new
    it 'should return a game with a mixture of spares, strikes and other bowls' do
        scorecard10.add_score(2,0)
        scorecard10.add_score(10,0)
        scorecard10.add_score(7,0)
        scorecard10.add_score(10,0)
        scorecard10.add_score(5,5)
        scorecard10.add_score(2,0)
        scorecard10.add_score(10,0)
        scorecard10.add_score(0,8)
        scorecard10.add_score(5,5)
        expect(scorecard10.add_score(5,5,5)).to eq "Game is over! You scored 116!"
    end

end




