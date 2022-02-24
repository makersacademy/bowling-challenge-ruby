class PinError < RuntimeError
    attr_reader :msg
  
    def initialize(msg = 'Number must be less than remaining pins')
      @msg = msg
      super(msg)
    end
end