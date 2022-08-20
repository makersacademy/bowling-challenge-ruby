require 'frame_repository'

RSpec.describe FrameRepository do
  context 'player plays a gutter game' do
    it 'returns 0 points' do
      frame_repo = FrameRepository.new
      frame = Frame.new(0, 0)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)

      expect(frame_repo.calculate_score).to eq 0
    end
  end

  context 'player plays a perfect game' do
    it 'returns 300 points' do
      frame_repo = FrameRepository.new
      frame = Frame.new(10, 0)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)
      frame_repo.add(frame)

      # Extra rolls due to strike in last frame
      frame = Frame.new(10, 10)
      frame_repo.add(frame)

      expect(frame_repo.calculate_score).to eq 300
    end
  end

  # refer to preperation.png in the images folder
  context 'player plays an example game ending with a spare' do
    xit 'returns 133 points' do
      
    end
  end
end