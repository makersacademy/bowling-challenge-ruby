require 'score'

describe Score do
  let(:game) { double('game_frames') }
  let(:score) { Score.new(game) }

  describe '#add_total' do
    context 'returns total score from each frame added'
    it 'returns score from first frame' do
      game_frames = [[1, 4]]
      allow(game).to receive(:frames).and_return(game_frames)
      allow(game).to receive(:spare?).and_return(false)
      allow(game).to receive(:strike?).and_return(false)
      expect(score.add_to_total).to eq 5
    end
    it 'returns score from 2 frames' do
      game_frames = [[1, 4]]
      allow(game).to receive(:frames).and_return(game_frames)
      allow(game).to receive(:spare?).and_return(false)
      allow(game).to receive(:strike?).and_return(false)
      score.add_to_total
      game_frames = [[4, 5]]
      allow(game).to receive(:frames).and_return(game_frames)
      allow(game).to receive(:spare?).and_return(false)
      allow(game).to receive(:strike?).and_return(false)
      expect(score.add_to_total).to eq 14
    end

    context 'returns score with added bonus'
    it 'adds a spare bonus if previous frame is a spare' do
      game_frames = [[6, 4], [10, 0]]
      allow(game).to receive(:frames).and_return(game_frames)
      allow(game).to receive(:spare?).and_return(true)
      expect(score.add_to_total).to eq 20
    end
    it 'adds a strike bonus if previous frame is a strike' do
      game_frames = [[10, 0], [0, 1]]
      allow(game).to receive(:frames).and_return(game_frames)
      allow(game).to receive(:spare?).and_return(false)
      allow(game).to receive(:strike?).and_return(true)
      expect(score.add_to_total).to eq 2
    end
  end

  describe '#add_bonus' do
    context 'a spare is scored'
    it 'adds spare bonus points' do
      game_frames = [[6, 4], [5, 5]]
      allow(game).to receive(:frames).and_return(game_frames)
      allow(game).to receive(:spare?).and_return(true)
      current_frame = [5, 5]
      expect(score.add_bonus(current_frame)).to eq 5
    end

    context 'a strike is scored'
    it 'adds strike bonus points' do
      game_frames = [[10, 1], [0, 1]]
      allow(game).to receive(:frames).and_return(game_frames)
      allow(game).to receive(:spare?).and_return(false)
      current_frame = [0, 1]
      expect(score.add_bonus(current_frame)).to eq 1
    end
  end
end
