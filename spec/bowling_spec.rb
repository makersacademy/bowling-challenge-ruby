require_relative '../lib/bowling'

RSpec.describe Bowling do

  let(:repo) { Bowling.new }

  def roll_multiple(count, pins)
    count.times { repo.roll(pins) }
  end

  context '#score' do
    it 'can score a gutter game' do
      roll_multiple(20, 0)
      expect(repo.score).to eq(0)
    end

    it 'can score a game of all ones' do
      roll_multiple(20, 1)
      expect(repo.score).to eq(20)
    end

    it 'can score a game of mixed rolls without spares and strikes' do
      roll_multiple(5, 1)
      roll_multiple(5, 2)
      roll_multiple(5, 3)
      roll_multiple(5, 5)
      expect(repo.score).to eq(55)
    end

  end
end