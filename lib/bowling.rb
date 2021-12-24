class Bowling
  def enter_score(pins)
    unless (0..10).include? pins
      raise 'Outside of Range'
    else
      'Nice'
    end
  end
end