# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:frame) { Frame.new(6) }

  it 'should take one argument when initialised' do
    expect { frame }.to_not raise_error
    expect { Frame.new }.to raise_error ArgumentError
  end

  it 'should be able to roll and add score to roll1' do
    expect { frame.roll(3) }.to change { frame.roll1 }.from(nil).to(3)
  end

  it 'should be able to roll and add score to roll2' do
    frame.roll(4)
    expect { frame.roll(3) }.to change { frame.roll2 }.from(nil).to(3)
  end

  it 'should be able to check whether a spare has been rolled' do
    frame.roll(3)
    frame.roll(7)
    expect(frame).to be_spare
  end

  it 'should be able to check whether a spare has not been rolled' do
    frame.roll(2)
    frame.roll(6)
    expect(frame).to_not be_spare
  end

  it 'should be able to check whether a strike has been rolled' do
    frame = Frame.new(2)
    frame.roll(10)
    expect(frame).to be_strike
  end

  it 'should be able to check whether a strike has not been rolled' do
    expect(frame).to_not be_strike
  end

  it 'should check if a frame is complete' do
    frame.roll(10)
    expect(frame).to be_complete
  end

  it 'should check if a game is not complete' do
    expect(frame).to_not be_complete
  end

  it 'should be able to add a bonus roll to roll3 when turn 10 and a strike or spare rolled' do
    strike = Frame.new(10)
    strike.roll(10)
    strike.roll(10)

    expect { strike.roll(3) }.to change { strike.roll3 }.from(nil).to(3)
  end

  it 'should raise an error if you try and roll when a game is complete' do
    frame.roll(10)

    expect { frame.roll(2) }.to raise_error 'This frame is complete'
  end

  it 'should not be able to roll more than 10 on any given roll' do
    expect { frame.roll(11) }.to raise_error 'You cannot roll more than 10'
  end

  it 'should raise an error if a roll of less than 0 is inputted' do
    expect { frame.roll(-1) }.to raise_error 'You cannot roll less than 0'
  end
end
