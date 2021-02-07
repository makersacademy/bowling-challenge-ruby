# frozen_string_literal: true

require 'game'

describe Game do
  let(:player) { double Player }
  let(:score_array) { double [2, 3, 4] }
  let(:score) { double Score.new(input_scores: score_array) }
  subject { described_class.new }

  it 'initializes with a progress measure' do
    expect(subject.progress).to eq 0
  end

  describe "#input_bowl" do
    it 'takes one argument; saves it to score' do
      expect(subject).to respond_to(:input_bowl).with(1).argument
    end

    it 'saves pins to score' do
      subject.input_bowl(2)
      expect(subject.progress).to eq(1)
    end
  end
end
