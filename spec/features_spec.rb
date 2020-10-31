# frozen_string_literal: true

require 'game'

describe 'Bowling scorecard features' do
  let(:game) { Game.new }

  it 'can store the score of a single roll and display it for the user' do
    game.record_roll(5)
    expect(game.check_current_frame).to eq([5])
  end

  it 'can display the correct score after multiple frames (no strikes or spares)' do
    game.record_roll(5)
    game.record_roll(2)
    game.record_roll(4)
    game.record_roll(1)
    game.record_roll(3)
    game.record_roll(6)
    expect(game.calculate_score).to eq(21)
  end

  it 'can display the correct score over multiple frames (including a spare)' do
    game.record_roll(5)
    game.record_roll(2)
    game.record_roll(7)
    game.record_roll(3)
    game.record_roll(3)
    game.record_roll(6)
    expect(game.calculate_score).to eq(29)
  end

  it 'can display the correct score over multiple frames (including multiple spares)' do
    game.record_roll(5)
    game.record_roll(2)
    game.record_roll(7)
    game.record_roll(3)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(2)
    game.record_roll(1)
    expect(game.calculate_score).to eq(35)
  end

  it 'can display the correct score over multiple frames (including a strike)' do
    game.record_roll(5)
    game.record_roll(2)
    game.record_roll(7)
    game.record_roll(3)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(1)
    expect(game.calculate_score).to eq(56)
  end

  it 'can correctly score a ten-frame game (no strike or spare on final frame)' do
    game.record_roll(5)
    game.record_roll(2)
    game.record_roll(7)
    game.record_roll(3)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(1)
    game.record_roll(6)
    game.record_roll(1)
    game.record_roll(2)
    game.record_roll(4)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(1)
    expect(game.calculate_score).to eq(105)
  end

  it 'can correctly score a full game with spare on final frame' do
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(2)
    game.record_roll(9)
    game.record_roll(1)
    game.record_roll(6)
    expect(game.calculate_score).to eq(52)
  end

  it 'can correctly score a gutter game' do
    20.times { game.record_roll(0) }
    expect(game.calculate_score).to eq(0)
  end

  it 'can correctly score a perfect game' do
    12.times { game.record_roll(10) }
    expect(game.calculate_score).to eq(300)
  end

  it 'does not allow bonus rolls if no strike or spare is rolled' do
    game.record_roll(5)
    game.record_roll(2)
    game.record_roll(7)
    game.record_roll(3)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(1)
    game.record_roll(6)
    game.record_roll(1)
    game.record_roll(2)
    game.record_roll(4)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(1)
    expect{game.record_roll(2)}.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end

  it 'does not allow more than one bonus roll if a spare is rolled' do
    game.record_roll(5)
    game.record_roll(2)
    game.record_roll(7)
    game.record_roll(3)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(1)
    game.record_roll(6)
    game.record_roll(1)
    game.record_roll(2)
    game.record_roll(4)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(8)
    game.record_roll(10)
    expect(game.calculate_score).to eq(129)
    expect{game.record_roll(2)}.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end

  it 'does not allow more than two bonus rolls if a strike is rolled' do
    game.record_roll(5)
    game.record_roll(2)
    game.record_roll(7)
    game.record_roll(3)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(1)
    game.record_roll(6)
    game.record_roll(1)
    game.record_roll(2)
    game.record_roll(4)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(1)
    expect{game.record_roll(2)}.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end
  it 'does not allow more than one bonus roll if a spare is rolled' do
    game.record_roll(5)
    game.record_roll(2)
    game.record_roll(7)
    game.record_roll(3)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(1)
    game.record_roll(6)
    game.record_roll(1)
    game.record_roll(2)
    game.record_roll(4)
    game.record_roll(3)
    game.record_roll(7)
    game.record_roll(10)
    game.record_roll(2)
    game.record_roll(8)
    game.record_roll(10)
    expect(game.calculate_score).to eq(129)
    expect{game.record_roll(2)}.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end

  it 'does not allow more than two bonus rolls if a strike is rolled' do
    expect{ 13.times{game.record_roll(10)} }.to raise_error("That was the last frame, kid. You want to roll again, start a new game")
  end
end
