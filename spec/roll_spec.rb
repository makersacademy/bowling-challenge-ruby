# frozen_string_literal: true

require 'roll'

describe Roll do
  roll = Roll.new(10)

  describe '#knock' do
    context 'can knock pins within number limit' do
      roll.knock(5)
      it { expect(roll.knocked_pins).to eq(5) }
    end

    context 'can not knock pins exceed number limit' do
      it { expect { roll.knock(11) }.to raise_error 'not enough pins left' }
    end
  end
end
