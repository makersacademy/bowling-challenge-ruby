# frozen_string_literal: true

require './lib/scorecard'

describe Scorecard do
  it 'is initialised with an array' do
    expect(subject.pins_knocked_down).to be_kind_of Array
  end
  it 'records the pins knocked down' do
    expect { subject.record_pins(10, 1, 1) }.to change { subject.pins_knocked_down[0][0] }.from(0).to(10)
  end
end

# expect { Counter.increment }.to change { Counter.count }.from(0).to(1)
