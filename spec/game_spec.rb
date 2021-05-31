require 'game'

describe Game do

  before do
    @game = Game.new
  end

  describe 'Gutter Game' do
    it 'when the player is having a bad day and not scoring a single pin' do
      20.times { subject.roll(0) }
      expect(subject.scoreboard).to eq 0
    end
  end

  describe 'Casual normal game' do
    it 'can count the knocked down pins from all twenty rolls' do
      subject.roll(6)
      subject.roll(3)
      subject.roll(8)
      subject.roll(0)
      expect(subject.scoreboard).to eq 17
    end

    it 'should raise an error when the player tries to knock down non-existent pins' do
      expect { subject.roll(15) }.to raise_error 'There are only 10 pins'
    end
  end

  describe 'Strike' do
    it 'knows when the player knocked down all pins in one go' do
      subject.roll(10)
      subject.roll(5)
      subject.roll(3)
      16.times { subject.roll(0) }
      expect(subject.scoreboard).to eq 26
    end

    # it 'gives a bonus roll if the player rolls a strike in the 10th frame' do
    #   18.times { subject.roll(0) }
    #   subject.roll(10)
    #   subject.roll(10)
    #   subject.roll(10)
    #   expect(subject.scoreboard).to eq 30
    # end
  end

  describe 'Spare' do
    it 'knows when the player knocked down all pins in one frame' do
      subject.roll(4)
      subject.roll(6)
      subject.roll(2)
      17.times { subject.roll(0) }
      expect(subject.scoreboard).to eq 14
    end

    it 'gives a bonus roll if the player rolls a spare in the 10th frame' do
      18.times { subject.roll(0) }
      subject.roll(1)
      subject.roll(9)
      subject.roll(10)
      expect(subject.scoreboard).to eq 20
    end
  end

  describe 'Perfect game' do
    it 'when the player rolls 12 strikes' do
      12.times { subject.roll(10) }
      expect(subject.scoreboard).to eq 300
    end
  end
end
