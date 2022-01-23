require 'bowling_game'

describe BowlingGame do
  let(:bowling) { BowlingGame.new }
    
  it 'starts a new game' do
    bowling = BowlingGame.new
  end

  it 'encounters a gutter game' do
    20.times { bowling.roll(0) }
    expect(bowling.score_card.sum).to eq 0
  end

  it 'encounters a perfect game' do
    15.times { bowling.roll(20) }
    expect(bowling.score_card.sum).to eq 300
  end

  context 'initialize game' do
    it 'has an empty array' do
      bowling.score_card
      expect(bowling.score_card).to be_empty
    end

    it 'takes the first score' do
      bowling.roll(6)
      expect(bowling.score_card).to eq [6]
    end    
  end

  context 'score card' do
    it 'can record multiple rolls' do
        bowling.roll(7)
        bowling.roll(9)
        bowling.roll(20)
        bowling.roll(15)

        expect(bowling.score_card[0]).to eq 7
        expect(bowling.score_card[1]).to eq 9
        expect(bowling.score_card[2]).to eq 20
        expect(bowling.score_card[3]).to eq 15
    end
  end
end
