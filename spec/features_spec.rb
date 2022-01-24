require 'score'

describe 'Bowling scorecard features' do
  let(:score) { Score.new }

  it 'can store the score of a single roll and display it for the user' do
    score.record_roll(5)
    expect(score.check_current_frame).to eq([5])
  end

  it 'can display the correct score after multiple frames (no strikes or spares)' do
    score.record_roll(5)
    score.record_roll(2)
    score.record_roll(4)
    score.record_roll(1)
    score.record_roll(3)
    score.record_roll(6)
    expect(score.calculate_score).to eq(21)
  end

  it 'can display the correct score over multiple frames (including a spare)' do
    score.record_roll(5)
    score.record_roll(2)
    score.record_roll(7)
    score.record_roll(3)
    score.record_roll(3)
    score.record_roll(6)
    expect(score.calculate_score).to eq(29)
  end

  it 'can display the correct score over multiple frames (including multiple spares)' do
    score.record_roll(5)
    score.record_roll(2)
    score.record_roll(7)
    score.record_roll(3)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(2)
    score.record_roll(1)
    expect(score.calculate_score).to eq(35)
  end

  it 'can display the correct score over multiple frames (including a strike)' do
    score.record_roll(5)
    score.record_roll(2)
    score.record_roll(7)
    score.record_roll(3)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(1)
    expect(score.calculate_score).to eq(56)
  end

  it 'can correctly score a ten-frame score (no strike or spare on final frame)' do
    score.record_roll(5)
    score.record_roll(2)
    score.record_roll(7)
    score.record_roll(3)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(1)
    score.record_roll(6)
    score.record_roll(1)
    score.record_roll(2)
    score.record_roll(4)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(1)
    expect(score.calculate_score).to eq(105)
  end

  it 'can correctly score a full score with spare on final frame' do
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(2)
    score.record_roll(9)
    score.record_roll(1)
    score.record_roll(6)
    expect(score.calculate_score).to eq(52)
  end

  it 'can correctly score a gutter score' do
    20.times { score.record_roll(0) }
    expect(score.calculate_score).to eq(0)
  end

  it 'can correctly score a perfect score' do
    12.times { score.record_roll(10) }
    expect(score.calculate_score).to eq(300)
  end

  it 'does not allow bonus rolls if no strike or spare is rolled' do
    score.record_roll(5)
    score.record_roll(2)
    score.record_roll(7)
    score.record_roll(3)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(1)
    score.record_roll(6)
    score.record_roll(1)
    score.record_roll(2)
    score.record_roll(4)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(1)
    expect{score.record_roll(2)}.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end

  it 'does not allow more than one bonus roll if a spare is rolled' do
    score.record_roll(5)
    score.record_roll(2)
    score.record_roll(7)
    score.record_roll(3)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(1)
    score.record_roll(6)
    score.record_roll(1)
    score.record_roll(2)
    score.record_roll(4)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(8)
    score.record_roll(10)
    expect(score.calculate_score).to eq(129)
    expect{score.record_roll(2)}.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end

  it 'does not allow more than two bonus rolls if a strike is rolled' do
    score.record_roll(5)
    score.record_roll(2)
    score.record_roll(7)
    score.record_roll(3)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(1)
    score.record_roll(6)
    score.record_roll(1)
    score.record_roll(2)
    score.record_roll(4)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(1)
    expect{score.record_roll(2)}.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end
  it 'does not allow more than one bonus roll if a spare is rolled' do
    score.record_roll(5)
    score.record_roll(2)
    score.record_roll(7)
    score.record_roll(3)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(1)
    score.record_roll(6)
    score.record_roll(1)
    score.record_roll(2)
    score.record_roll(4)
    score.record_roll(3)
    score.record_roll(7)
    score.record_roll(10)
    score.record_roll(2)
    score.record_roll(8)
    score.record_roll(10)
    expect(score.calculate_score).to eq(129)
    expect{score.record_roll(2)}.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end

  it 'does not allow more than two bonus rolls if a strike is rolled' do
    expect{ 13.times{score.record_roll(10)} }.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end
end