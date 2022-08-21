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

      expect(frame_repo.calculate_score).to eq "Your score: #{0}"
    end
  end

  context 'player plays a perfect game' do
    it 'returns 300 points with score updates between every frame' do
      frame_repo = FrameRepository.new
      frame = Frame.new(10, 0)
      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{10} + next two rolls" 

      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{30} + next two rolls"

      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{60} + next two rolls" 

      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{90} + next two rolls"

      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{120} + next two rolls"

      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{150} + next two rolls"

      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{180} + next two rolls"

      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{210} + next two rolls"

      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{240} + next two rolls"

      frame_repo.add(frame)
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{270} + next two rolls"

      # Extra rolls due to strike in last frame
      frame = Frame.new(10, 10)
      frame_repo.add(frame)

      expect(frame_repo.calculate_score).to eq "Your score: #{300}"
    end
  end

  # refer to preperation.excalidraw in the images folder
  context 'player plays an example game ending with a spare' do
    it 'returns 133 points with score updates between every frame' do
      frame_repo = FrameRepository.new
      frame_repo.add(Frame.new(1, 4))
      expect(frame_repo.calculate_score).to eq "Your score: #{5}"

      frame_repo.add(Frame.new(4, 5))
      expect(frame_repo.calculate_score).to eq "Your score: #{14}"

      frame_repo.add(Frame.new(6, 4))   # SPARE
      expect(frame_repo.calculate_score).to eq "Spare! Your score: #{24} + next roll" 

      frame_repo.add(Frame.new(5, 5))   # SPARE
      expect(frame_repo.calculate_score).to eq "Spare! Your score: #{39} + next roll" 

      frame_repo.add(Frame.new(10, 0))  # STRIKE
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{59} + next two rolls" 

      frame_repo.add(Frame.new(0, 1))
      expect(frame_repo.calculate_score).to eq "Your score: #{61}"

      frame_repo.add(Frame.new(7, 3))   # SPARE
      expect(frame_repo.calculate_score).to eq "Spare! Your score: #{71} + next roll" 

      frame_repo.add(Frame.new(6, 4))   # SPARE
      expect(frame_repo.calculate_score).to eq "Spare! Your score: #{87} + next roll" 

      frame_repo.add(Frame.new(10, 0))  # STRIKE
      expect(frame_repo.calculate_score).to eq "Strike! Your score: #{107} + next two rolls" 

      frame_repo.add(Frame.new(2, 8))   # SPARE
      expect(frame_repo.calculate_score).to eq "Spare! Your score: #{127} + next roll" 

      # Extra roll due to spare in last frame
      frame_repo.add(Frame.new(6, 0))
      expect(frame_repo.calculate_score).to eq "Your score: #{133}"
    end

    it 'returns 133 points' do
      frame_repo = FrameRepository.new
      frame_repo.add(Frame.new(1, 4))
      frame_repo.add(Frame.new(4, 5))
      frame_repo.add(Frame.new(6, 4))   # SPARE
      frame_repo.add(Frame.new(5, 5))   # SPARE
      frame_repo.add(Frame.new(10, 0))  # STRIKE
      frame_repo.add(Frame.new(0, 1))
      frame_repo.add(Frame.new(7, 3))   # SPARE
      frame_repo.add(Frame.new(6, 4))   # SPARE
      frame_repo.add(Frame.new(10, 0))  # STRIKE
      frame_repo.add(Frame.new(2, 8))   # SPARE

      # Extra rolls due to spare in last frame
      frame_repo.add(Frame.new(6, 0))

      expect(frame_repo.calculate_score).to eq "Your score: #{133}"
    end
  end
end