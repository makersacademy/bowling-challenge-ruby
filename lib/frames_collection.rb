class FramesCollection
  attr_reader :collection

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @collection = []
  end

  def add_frame(number)
    @collection << @frame_class.new(number)
  end

  def frame(number)
    @collection[number - 1]
  end
end
