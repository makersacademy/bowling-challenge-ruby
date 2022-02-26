# frozen_string_literal: true

describe 'logging rolls to the scorecard' do
  it 'first frame, first roll, no strike' do
    scorecard = ScoreCard.new
    scorecard.log_roll(7)
    expect(scorecard.score).to eq 0
  end

  it 'first frame, second roll, no spare' do
    scorecard = ScoreCard.new
    scorecard.log_roll(7)
    scorecard.log_roll(2)
    expect(scorecard.score).to eq 9
  end

  it "is having a great mid game" do
    scorecard = ScoreCard.new
    scorecard.log_roll(10)
    scorecard.log_roll(3)
    scorecard.log_roll(7)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(5)
    scorecard.log_roll(5)
    scorecard.log_roll(6)

    expect(scorecard.current_frame_number).to eq 7
    expect(scorecard.score).to eq 131

  end

  it "You're awesome, a perfect game" do
    scorecard = ScoreCard.new
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    scorecard.log_roll(10)
    expect(scorecard.score).to eq 300
    expect(scorecard.current_frame_number).to eq 10
    
  end

  it 'having a bad day.. Gutter Game!' do
    scorecard = ScoreCard.new
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)
    scorecard.log_roll(0)

    expect(scorecard.score).to eq 0
    expect(scorecard.current_frame_number).to eq 10
  end

end
