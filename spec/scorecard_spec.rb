require 'scorecard'

RSpec.describe Scorecard do 
  it "returns score when Gutter Game" do 
    scorecard = Scorecard.new 
    10.times{scorecard.frame(0, 0)}
    expect(scorecard.total_scores).to eq(0)
  end 

  it "returns score when Perfect Game" do 
    scorecard = Scorecard.new 
    9.times{scorecard.frame(10, 0)}
    scorecard.frame(10, 10)
    scorecard.frame(10, 0)
    expect(scorecard.total_scores).to eq(300)
  end 

  it "returns the correct score if no spares or strikes" do 
    scorecard = Scorecard.new 
    2.times{scorecard.frame(4, 2)}
    2.times{scorecard.frame(5, 1)}
    2.times{scorecard.frame(0, 7)}
    2.times{scorecard.frame(9, 0)}
    2.times{scorecard.frame(8, 1)}
    expect(scorecard.total_scores).to eq(74)
  end 

  it "returns the correct score if spare" do
    scorecard = Scorecard.new 
    scorecard.frame(4, 6)
    scorecard.frame(3, 2)
    6.times{scorecard.frame(0, 0)}
    scorecard.frame(3, 7)
    scorecard.frame(1, 2)
    expect(scorecard.total_scores).to eq(32)
  end

  it "returns the correct score if strike" do 
    scorecard = Scorecard.new 
    scorecard.frame(10, 0)
    scorecard.frame(10, 0)
    scorecard.frame(3, 2)
    8.times{scorecard.frame(0, 0)}
    expect(scorecard.total_scores).to eq(43)
  end 

  context "checking if bonus is correct for frames 8, 9 and 10 " do 

    it "returns correct score if 3 strikes in a row" do 
      scorecard = Scorecard.new 
      7.times{scorecard.frame(0, 0)}
      3.times{scorecard.frame(10, 0)}
      scorecard.frame(0, 0)
      expect(scorecard.total_scores).to eq(60)
    end 

    it "returns the correct score if multiple spares and strikes " do
      scorecard = Scorecard.new 
      scorecard.frame(1, 4)
      scorecard.frame(4, 5)
      scorecard.frame(6, 4)
      scorecard.frame(5, 5)
      scorecard.frame(10, 0)
      scorecard.frame(0, 1)
      scorecard.frame(7, 3)
      scorecard.frame(6, 4)
      scorecard.frame(10, 0)
      scorecard.frame(2, 8)    
      scorecard.frame(6, 0)
      expect(scorecard.total_scores).to eq(133)
    end 
  end 
end 

    