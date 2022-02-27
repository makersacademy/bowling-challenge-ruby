class Frame

  def first_roll(pinfall)
    return 'STRIKE! End of frame' if pinfall == 10 
    return 'Player to roll again'
  end
end
