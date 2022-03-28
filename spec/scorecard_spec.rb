require 'scorecard'

describe Scorecard do
  
  let(:scorecard) {Scorecard.new}
  let(:incomplete_frame) { double(:incomplete_frame, :complete? => false, roll: true) } 
  let(:complete_frame) { double(:complete_frame, :complete? => true, roll: true)}

  it "initialises with turn as 1" do
    expect(scorecard.turn).to eq 1
  end

  it "initialises with frames as an array with one frame" do
    expect(scorecard.frames).to include(a_kind_of(Frame))
    expect(scorecard.frames.length).to eq 1
  end

  it "when rolled should create a new frame if the frame is complete" do
    allow(Frame).to receive(:new).and_return(complete_frame)

    expect { scorecard.roll(2) }.to change { scorecard.frames.length }.by(1)
  end

  it "should let you roll a second roll for the same frame if the frame is incomplete" do
    allow(Frame).to receive(:new).and_return(incomplete_frame)
    scorecard.roll(8)

    expect(scorecard.frames.length).to eq 1
  end
  
  it "raises an error when trying to roll after 10 frames" do
    scorecard = Scorecard.new(10)
    scorecard.roll(2)
    scorecard.roll(2)

    expect { scorecard.roll(2) }.to raise_error "Your game is complete"
  end

  it "should calculate score" do
    scorecard.roll(3)
    scorecard.roll(5)

    expect(scorecard.score).to eq 8
  end
  
  it "should calculate a score whereby a strike is worth 10 plus the following frames score" do
    scorecard.roll(10)
    scorecard.roll(3)
    scorecard.roll(4)

    expect(scorecard.score).to eq 24
  end

  it "should calculate a score whereby a spare is worth 10 plus the following rolls score" do
    scorecard.roll(7)
    scorecard.roll(3)
    scorecard.roll(4)
    scorecard.roll(2)

    expect(scorecard.score).to eq 20
  end
  
  it "should calculate a correct score across multiple frames" do
    scorecard.roll(10)
    scorecard.roll(2)
    scorecard.roll(8)
    scorecard.roll(5)
    scorecard.roll(4)
    scorecard.roll(2)
    scorecard.roll(6)
    
    expect(scorecard.score).to eq 52
  end

  it "should calculate a perfect game to be 300" do
    12.times { scorecard.roll(10) }

    expect(scorecard.score).to eq 300
  end

  it "should correctly calculate a strike followed by a spare followed by another frame" do
    scorecard.roll(10)
    scorecard.roll(8)
    scorecard.roll(2)
    scorecard.roll(3)
    scorecard.roll(6)

    expect(scorecard.score).to eq 42
  end

  it "should calculate two strikes followed by a standard roll followed by a spare" do
    scorecard.roll(10)
    scorecard.roll(10)
    scorecard.roll(3)
    scorecard.roll(5)
    scorecard.roll(5)
    scorecard.roll(5)

    expect(scorecard.score).to eq 59
  end
end