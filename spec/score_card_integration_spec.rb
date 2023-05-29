require 'frame'
require 'score_card'

RSpec.describe 'integration' do
  it 'ScoreCard initializes with 10 frames, correctly numbered' do
    score_card = ScoreCard.new
    
    expect(score_card.frames.length).to eq(10)
    expect(score_card.frames[0].frame_number).to eq(1)
    expect(score_card.frames[1].frame_number).to eq(2)
    expect(score_card.frames[2].frame_number).to eq(3)
    expect(score_card.frames[3].frame_number).to eq(4)
    expect(score_card.frames[4].frame_number).to eq(5)
    expect(score_card.frames[5].frame_number).to eq(6)
    expect(score_card.frames[6].frame_number).to eq(7)
    expect(score_card.frames[7].frame_number).to eq(8)
    expect(score_card.frames[8].frame_number).to eq(9)
    expect(score_card.frames[9].frame_number).to eq(10)
  end
  
  it 'can enter "regular" rolls into the first frame' do
    score_card = ScoreCard.new
    
    score_card.roll_current_frame(5)
    score_card.roll_current_frame(2)
    score_card.frames[0].calculate_frame_score
    
    expect(score_card.frames[0].rolls).to eq [5, 2]
    expect(score_card.frames[0].frame_score).to eq 7
  end
  
  it 'marks a "regular" frame completed after two non-strike rolls' do
    score_card = ScoreCard.new

    score_card.roll_current_frame(5)
    expect(score_card.frames[0].complete).to eq false


    score_card.roll_current_frame(2)
    expect(score_card.frames[0].complete).to eq true
  end

  it 'marks a "regular" frame complete after a single strike' do
    score_card = ScoreCard.new

    score_card.roll_current_frame(10)

    expect(score_card.frames[0].is_strike?).to eq true
    expect(score_card.frames[0].complete).to eq true
  end
  
  it 'marks a "regular" frame complete after a single strike' do
    score_card = ScoreCard.new

    score_card.roll_current_frame(10)

    expect(score_card.frames[0].is_strike?).to eq true
    expect(score_card.frames[0].complete).to eq true
  end

  it 'updates the current frame index correctly after frame is completed' do
    score_card = ScoreCard.new

    score_card.roll_current_frame(10)

    expect(score_card.current_frame_index).to eq 1
  end

  it 'can enter subsequent rolls into correct "regular" frames' do
    score_card = ScoreCard.new

    score_card.roll_current_frame(2)
    score_card.roll_current_frame(2)
    expect(score_card.frames[0].complete).to eq true
    expect(score_card.current_frame_index).to eq 1

    score_card.roll_current_frame(5)
    score_card.roll_current_frame(2)
    score_card.frames[1].calculate_frame_score

    expect(score_card.frames[1].rolls).to eq [5, 2]
    expect(score_card.frames[1].frame_score).to eq 7
    expect(score_card.current_frame_index).to eq 2
  end
  
  it 'after strike, can enter subsequent rolls into correct "regular" frames' do
    score_card = ScoreCard.new

    score_card.roll_current_frame(10)
    expect(score_card.frames[0].complete).to eq true
    expect(score_card.current_frame_index).to eq 1

    score_card.roll_current_frame(5)
    score_card.roll_current_frame(2)
    expect(score_card.current_frame_index).to eq 2
  end
  
  it 'calculates the bonus score for a regular spare frame' do
    score_card = ScoreCard.new

    score_card.roll_current_frame(5)
    score_card.roll_current_frame(5)
    expect(score_card.frames[0].is_spare?).to eq true

    score_card.roll_current_frame(1)
    score_card.roll_current_frame(2)
    
    score_card.calculate_bonus_scores
    expect(score_card.frames[0].bonus_score).to eq 1

    score_card.frames[0].calculate_total_score
    expect(score_card.frames[0].frame_score).to eq 10
    expect(score_card.frames[0].total_score).to eq 11
  end

  it 'calculates the bonus score for a ninth spare frame' do
    score_card = ScoreCard.new

    # 8 frames of zeros 
    16.times do
      score_card.roll_current_frame(0)
    end

    # ninth frame is a spare
    score_card.roll_current_frame(5)
    score_card.roll_current_frame(5)
    expect(score_card.frames[8].is_spare?).to eq true

    #rolls of tenth frame
    score_card.roll_current_frame(1)
    score_card.roll_current_frame(1)

    score_card.calculate_bonus_scores
    expect(score_card.frames[8].bonus_score).to eq 1

    score_card.frames[8].calculate_total_score
    expect(score_card.frames[8].frame_score).to eq 10
    expect(score_card.frames[8].total_score).to eq 11
  end

  it 'calculates the bonus score for a regular strike frame (when next roll not a strike)' do
    score_card = ScoreCard.new
    # frame 1: strike
    score_card.roll_current_frame(10)
    # frame 2: two regular rolls scoring 5
    score_card.roll_current_frame(2)
    score_card.roll_current_frame(3)

    score_card.calculate_bonus_scores
    # frame 1: bonus score of 5
    expect(score_card.frames[0].bonus_score).to eq 5

    score_card.frames[0].calculate_total_score
    expect(score_card.frames[0].frame_score).to eq 10
    expect(score_card.frames[0].total_score).to eq 15
  end 

  it 'calculates the bonus score for a regular strike frame (when next roll is a strike)' do
    score_card = ScoreCard.new
    # frame 1 strike
    score_card.roll_current_frame(10)
    # frame 2 strike
    score_card.roll_current_frame(10)
    # frame 3 regular rolls
    score_card.roll_current_frame(1)
    score_card.roll_current_frame(1)

    score_card.calculate_bonus_scores

    expect(score_card.frames[0].bonus_score).to eq 11
    expect(score_card.frames[1].bonus_score).to eq 2

    score_card.frames[0].calculate_total_score
    expect(score_card.frames[0].frame_score).to eq 10
    expect(score_card.frames[0].total_score).to eq 21

    score_card.frames[1].calculate_total_score
    expect(score_card.frames[1].frame_score).to eq 10
    expect(score_card.frames[1].total_score).to eq 12
  end 

  xit 'calculates the bonus score for a tenth frame spare' do
    score_card = ScoreCard.new

    # 9 frames of zeros 
    16.times do
      score_card.roll_current_frame(0)
    end

    score_card.roll_current_frame(10)

    expect(score_card)
  end

  xit 'calculates the bonus score for a tenth frame strike' do
    
  end

  xit 'calculates game score of 0 for a Gutter Game' do
    score_card = ScoreCard.new

    20.times{ score_card.roll_current_frame(0) }

    expect(score_card.calculate_game_score).to eq(0)
  end

  xit 'calculates game score of 90 when each roll is 1' do
    score_card = ScoreCard.new

    20.times{ score_card.roll_current_frame(1) }

    expect(score_card.calculate_game_score).to eq(20)
  end

  xit 'returns game score of 300 for a Perfect Game' do
    score_card = ScoreCard.new

    21.times{ score_card.roll_current_frame(10) }

    expect(score_card.calculate_game_score).to eq(300)
  end
end