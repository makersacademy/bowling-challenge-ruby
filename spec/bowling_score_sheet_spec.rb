require 'bowling_score_sheet'

RSpec.describe BowlingScoreSheet do
  it 'calculates the running score of a game with no strikes or spares' do
    io = double :io
    score_sheet = BowlingScoreSheet.new
    20.times do
      score_sheet.add_roll(1)
    end

    total_score = score_sheet.all_frames.sum do |frame|
      frame.total_score
    end
    expect(total_score).to eq 20
  end

  it 'calculates the running score of a game with a spare (not in final frame) and no strikes' do
    io = double :io
    score_sheet = BowlingScoreSheet.new
    
    score_sheet.add_roll(2)
    score_sheet.add_roll(8)

    18.times do
      score_sheet.add_roll(1)
    end

    total_score = score_sheet.all_frames.sum do |frame|
      frame.total_score
    end
    expect(total_score).to eq 29
  end


  it 'calculates the running score of a game with a strike (not in final frame) and no spares' do
    io = double :io
    score_sheet = BowlingScoreSheet.new
    
    score_sheet.add_roll(10)
    score_sheet.add_roll(2)
    score_sheet.add_roll(3)
    16.times do
      score_sheet.add_roll(1)
    end

    total_score = score_sheet.all_frames.sum do |frame|
      frame.total_score
    end
    expect(total_score).to eq 36
  end

  it 'calculates the running score of a game with multiple strikes (not in final frame) and no spares' do
    io = double :io
    score_sheet = BowlingScoreSheet.new
    
    score_sheet.add_roll(10)
    score_sheet.add_roll(10)
    score_sheet.add_roll(2)
    score_sheet.add_roll(3)

    14.times do
      score_sheet.add_roll(1)
    end

    total_score = score_sheet.all_frames.sum do |frame|
      frame.total_score
    end
    expect(total_score).to eq 56
  end

  it 'calculates the running score of a game with multiple strikes and spares (not in final frame)' do
    io = double :io
    score_sheet = BowlingScoreSheet.new
    
    score_sheet.add_roll(10)
    score_sheet.add_roll(10)
    score_sheet.add_roll(2)
    score_sheet.add_roll(8)
    score_sheet.add_roll(8)
    score_sheet.add_roll(2)
    score_sheet.add_roll(10)

    10.times do
      score_sheet.add_roll(1)
    end

    total_score = score_sheet.all_frames.sum do |frame|
      frame.total_score
    end
    expect(total_score).to eq 102
  end

  it 'calculates the running score of a game with a strike in final frame' do
    io = double :io
    score_sheet = BowlingScoreSheet.new
    
    18.times do
      score_sheet.add_roll(1)
    end
    score_sheet.add_roll(10)
    score_sheet.add_roll(2)
    score_sheet.add_roll(3)

    total_score = score_sheet.all_frames.sum do |frame|
      frame.round <= 10 ? frame.total_score : 0
    end
    expect(total_score).to eq 33
  end

  it 'calculates the running score of a game with a spare in final frame' do
    io = double :io
    score_sheet = BowlingScoreSheet.new
    
    19.times do
      score_sheet.add_roll(1)
    end
    score_sheet.add_roll(9)
    score_sheet.add_roll(2)

    total_score = score_sheet.all_frames.sum do |frame|
      frame.round <= 10 ? frame.total_score : 0
    end
    expect(total_score).to eq 30
  end

  it 'calculates the running score of a game with a mix of spares and stikes' do
    io = double :io
    score_sheet = BowlingScoreSheet.new
    
    10.times do
      score_sheet.add_roll(1)
    end

    score_sheet.add_roll(10)
    score_sheet.add_roll(10)
    score_sheet.add_roll(2)
    score_sheet.add_roll(8)
    score_sheet.add_roll(8)
    score_sheet.add_roll(2)
    score_sheet.add_roll(10)
    score_sheet.add_roll(4)
    score_sheet.add_roll(5)


    total_score = score_sheet.all_frames.sum do |frame|
      frame.round <= 10 ? frame.total_score : 0
    end
    expect(total_score).to eq 109
  end

end