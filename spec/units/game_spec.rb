# frozen_string_literal: true

require 'game'

describe Game do
  let(:player) { double Player }
  let(:score_array) { double [2, 3, 4] }
  let(:score) { double Score.new(input_scores: score_array) }
  subject { described_class.new }

  it 'initializes with an empty frames array' do
    expect(subject.frames).to eq []
  end

  describe '#input_bowl' do
    context 'first 1-9 rolls' do
      it 'takes one argument; saves it to score' do
        expect(subject).to respond_to(:input_bowl).with(1).argument
      end

      it 'saves pins and adds to score' do
        subject.input_bowl(2)
        subject.input_bowl(5)
        expect(subject.score_list[0][:pins]).to eq 2
        expect(subject.scores[:pins]).to eq 5
        subject.calculate_score
        expect(subject.running_total).to eq 7
      end

      it 'makes a second frame on third roll' do
        subject.input_bowl(2)
        subject.input_bowl(5)
        subject.input_bowl(5)
        expect(subject.frames.length).to eq 2
      end

      it 'closes frame after strike and opens new frame on next roll' do
        subject.input_bowl(10)
        subject.input_bowl(5)
        expect(subject.frames.length).to eq 2
      end
    end

    context 'final roll' do
      it 'allows third roll if strike' do
        18.times { subject.input_bowl(2) }
        subject.input_bowl(10)
        expect(subject.frames.length).to eq 10
        subject.input_bowl(10)
        subject.input_bowl(10)
      end
    end

    context 'end of game' do
      it 'says game over and prevents more bowls' do
        20.times { subject.input_bowl(2) }
        expect {subject.input_bowl(2) }.to raise_error "Game over"
      end
    end
  end

  context "bonus" do
    it "initiates a bonus class if strike" do
      subject.input_bowl(10)
      subject.input_bowl(3)
      expect(subject.bonus).to eq 3
    end

    it "initiates a bonus class if spare" do
      subject.input_bowl(8)
      subject.input_bowl(2)
      subject.input_bowl(3)
      expect(subject.bonus).to eq 3
    end
  end
end
