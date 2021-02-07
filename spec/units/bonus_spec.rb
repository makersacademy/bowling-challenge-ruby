# frozen_string_literal: true

require 'bonus'

describe Bonus do
  subject {described_class.new(9, 3) }
  it 'saves the pins of the last roll' do
    expect(subject.pins).to eq 3
  end
end
