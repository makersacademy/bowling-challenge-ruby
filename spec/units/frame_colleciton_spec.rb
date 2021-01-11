require 'frames_collection'


describe FramesCollection do
  let(:frames_collection) { FramesCollection.new }

  it "should record a collection of frames" do
    expect(frames_collection.collection).to be_an Array
  end

  describe "#add_frame" do
    it "should add a frame to the collection" do
      expect(frames_collection.add_frame(1)).to include Frame
    end
  end

  describe '#frame' do
    it "should return the chosen frame from the collection" do
      frames_collection.add_frame(1)
      frame = frames_collection.frame(1)
      expect(frame.number).to eq 1
    end
  end
end
