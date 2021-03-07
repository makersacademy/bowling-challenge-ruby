require 'framescore'

describe FrameScore do
  let(:bowl_1) { double(:bowl, pins: 3) }
  let(:bowl_2) { double(:bowl, pins: 6) }
  let(:bowl_3) { double(:bowl, pins: 10) }
  let(:bowl_4) { double(:bowl, pins: 4) }

  let(:frame_1) { double(:frame, pins: 9, bowls: [bowl_1, bowl_2]) }
  let(:frame_2) { double(:frame, pins: 10, bowls: [bowl_3]) }
  let(:frame_3) { double(:frame, pins: 10, bowls: [bowl_2, bowl_4]) }
  
  subject(:open) { described_class.new(frame: frame_1) }
  subject(:strike) { described_class.new(frame: frame_2) }
  subject(:spare) { described_class.new(frame: frame_3) }
  
  it 'shows the score for a frame' do
    expect(open.score).to eq 9
  end

  it 'marks the scoring of a frame as complete' do
    expect(open.final).to eq true
  end

  it 'does not score a frame if it is not complete' do
    expect(strike.score).to eq 0
  end

  it 'does not mark a frame score as final if a strike is bowled' do
    expect(strike.final).to eq false
  end

  it 'correctly scores a spare' do
    spare.add_bonus_bowl(bowl: bowl_1)

    expect(spare.score).to eq 13
    expect(spare.final).to eq true
  end

  it 'correctly scores a strike' do
    strike.add_bonus_bowl(bowl:bowl_3)

    expect(strike.score).to eq 0
    expect(strike.final).to eq false

    strike.add_bonus_bowl(bowl: bowl_2)

    expect(strike.score).to eq 26
    expect(strike.final).to eq true
  end
end