class Display
  def initialize(frames:)
    @frames = frames
  end

  def show
    print 'Frames '
    @frames.each { |frame| print "| %02d |" % frame.number }
    print "\nBowls  "
    @frames.each { |frame| print "| #{frame.bowls.first.pins}#{frame.bowls.last.pins} |" } 
    print "\nScore  "
    @frames.each { |frame| print "| -- |"  }
  end
end