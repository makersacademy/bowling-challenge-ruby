# frozen_string_literal: true

require 'roll'

describe Roll do
  it 'initializes the roll with pins as a parameter' do
    expect { Roll.new(5) }.to_not raise_error
  end

  it 'raises an error when the amount of pins is negative' do
    expect { Roll.new(-5) }.to raise_error(IncorrectRollError, 'Cannot roll negative amount of pins')
  end

  it 'raises and error when the amount of pins exceeds the maximum' do
    expect do
      Roll.new(Roll::MAX_PINS + 1)
    end.to raise_error(IncorrectRollError, 'Cannot roll more than a maximum amount of pins')
  end
end
