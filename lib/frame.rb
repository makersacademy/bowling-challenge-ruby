class Frame
  attr_reader :number, :bowls

  def initialize(number:, bowl_class: Bowl)
    @number = number
    @bowl_class = bowl_class
    @bowls = []
  end

  def add(pins:)
    bowl = @bowl_class.new(pins: pins)
    @bowls.push(bowl)
  end

  def score
    @bowls.map { |bowl| bowl.pins }.sum
  end

  # private methods - add defers to normal_frame method or final_frame method?
end
