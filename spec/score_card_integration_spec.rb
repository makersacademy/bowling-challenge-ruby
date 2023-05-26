require 'frame'
require 'score_card'

RSpec.describe 'integration' do
  it 'initializes with game score of 0' do
    score_card = ScoreCard.new

    expect(score_card.calculate_game_score).to eq(0)
  end

  it 'ScoreCard can make new frames with the correct frame_number' do
    score_card = ScoreCard.new

    score_card.add_frame
    expect(score_card.frames.length).to eq 1
    expect(score_card.frames[0].frame_number).to eq 1

    score_card.add_frame
    expect(score_card.frames.length).to eq 2
    expect(score_card.frames[1].frame_number).to eq 2
  end

  it 'ScoreCard can enter "standard" rolls into the first frame' do
    score_card = ScoreCard.new

    score_card.add_frame
    score_card.roll_current_frame(5)
    score_card.roll_current_frame(2)

    expect(score_card.frames[0].rolls).to eq [5, 2]
    expect(score_card.frames[0].calculate_frame_score).to eq 7
  end

  it 'ScoreCard marks a "standard" frame completed after two non-strike rolls' do
    score_card = ScoreCard.new

    score_card.add_frame
    score_card.roll_current_frame(5)
    expect(score_card.frames[0].complete).to eq false


    score_card.roll_current_frame(2)
    expect(score_card.frames[0].complete).to eq true
  end

  it 'ScoreCard marks a "standard" frame complete after a single strike' do
    score_card = ScoreCard.new

    score_card.add_frame
    score_card.roll_current_frame(10)

    expect(score_card.frames[0].is_strike?).to eq true
    expect(score_card.frames[0].complete).to eq true
  end

  it 'ScoreCard will fail when an eleven frame is attempted' do
    score_card = ScoreCard.new

    10.times { score_card.add_frame }

    expect{score_card.add_frame}.to raise_error "A game may only consist of 10 frames"
  end

  xit 'returns game score of 0 for a Gutter Game' do
    score_card = ScoreCard.new
    # some method calls
    expect(score_card.calculate_game_score).to eq(0)
  end

  xit 'returns game score of 300 for a Perfect Game' do
    
  end
end