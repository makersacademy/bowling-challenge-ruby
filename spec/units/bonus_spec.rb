# frozen_string_literal: true

require 'bonus'

describe Bonus do
  subject { described_class.new(2) }

  it 'reduces its status by 1' do
    subject.per_roll(3)
    expect(subject.status).to eq 1
  end

  it 'saves the pins of the next roll' do
    subject.per_roll(3)
    expect(subject.extra).to eq 3
  end
end
