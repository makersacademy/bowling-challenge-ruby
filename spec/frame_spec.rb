require 'frame'

describe Frames do
  it 'checks if last frame has a strike' do
    subject.create_new([10])
    expect(subject.previous_was_strike?).to eq true
  end

  it 'checks if last frame was a spare' do
    subject.create_new([4, 6])
    expect(subject.previous_was_spare?).to eq true
  end

  it 'can return the total points from all frames' do
    subject.create_new([4, 2])
    subject.create_new([4, 2])
    expect(subject.total_points).to eq 12
  end

  it 'add bonus points for strikes' do
    subject.create_new([10])
    subject.create_new([4, 2])
    expect(subject.total_points).to eq 22
  end

  it 'add bonus points for spares' do
    subject.create_new([6, 4])
    subject.create_new([4, 2])
    expect(subject.total_points).to eq 20
  end

  it 'strike on tenth frame adds bonus points' do
    9.times { subject.create_new([3, 4]) }
    subject.create_new([10])
    subject.create_new([5])
    expect(subject.total_points).to eq 78
  end

  it 'spare on tenth frame adds bonus points' do
    9.times { subject.create_new([3, 4]) }
    subject.create_new([4, 6])
    subject.create_new([7])
    expect(subject.total_points).to eq 80
  end
end