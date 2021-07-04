require 'rules'
require 'scorecard'

  describe ScoreCard do

    include Rules

    let(:subject) { described_class.new }
    let(:first_throw) { double(:first_throw, first_throw: 10) }
    let(:second_throw) { double(:second_throw, second_throw: 7) }

    describe '#initialize' do
      it 'initializes the class' do
        expect(subject.frame).to eq 1
        expect(subject.first_throw).to eq 0
        expect(subject.second_throw).to eq 0
        expect(subject.bonus_roll).to eq 1
        expect(subject.pins_per_frame).to eq []
        expect(subject.total_score).to eq 0
        expect(subject.previous_turn_bonus).to eq []
      end
    end

    describe '#user_input' do
      it 'returns valid input' do 
        subject.stub(:user_input).and_return(10)
        expect(subject.user_input).to eq 10
      end
    end


    describe '#set_turn_bonus' do
      it 'sets bonus based off the number of strikes' do
      expect(subject.set_turn_bonus(10, 10)).to eq ["strike"]
      end
    end

    describe '#score_hit' do
      it 'calculates score' do 
        subject.score_hit(5, 5)
        expect(subject.score_hit(5, 5)).to eq 10
      end
    end

    describe '#score_entry' do
      it 'Registers double strike' do 
        subject.score_entry(10, 0)
        expect(subject.score_entry(10, 0)).to eq ["strike", "strike"]
      end
    end
  end