require 'scorer'

describe "when given a score" do

  it "returns the score for 1 frame" do
  
    expect(scorer([[1 , 2]])).to eq 3
  end

  it "returns the score for x2 frame" do
  
    expect(scorer([[1 , 2], [2, 3]])).to eq 8
  end

  it "returns the score for x2 frame with a spare on frame 1" do
  
    expect(scorer([[1 , "/"], [2, 3]])).to eq 17
  end

  it "returns the score for x3 frame with a spare on frame 2" do
  
    expect(scorer([[1 , 7], [2, "/"], [4, 5]])).to eq 31
  end


  it "returns the score for x3 frame with a spare on frame 2" do
  
    expect(scorer([[1 , 7], [2, 5], [4, "/"], [3, 4]])).to eq 35
  end

  it "returns the score for x3 frame with a 2 spares in a row" do
  
    expect(scorer([[2, "/"], [4, "/"], [3, 4]])).to eq 34
  end

  it "returns the score for x3 frame with a 3 spares in a row" do
  
    expect(scorer([[2, "/"], [4, "/"], [3, "/"], [4, 5]])).to eq 50
  end

  it "returns the score for x2 frame with a strike on frame 1" do
  
    expect(scorer([["X",""], [2, 5]])).to eq 24
  end

  it "returns the score for x3 frame with 2 strikes in a row" do
  
    expect(scorer([["X",""], ["X",""], [2, 5]])).to eq 24
  end



end