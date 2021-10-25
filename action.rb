module Action
  private
  def strike(pins, count)
    @strike[balls[count.+(1)]] && balls[count.+(1)] != @bonus ? pins.first + balls[count.+(1)].first + balls[count.+(2)].first : pins.first + @sum[balls[count.+(1)]]
  end

  def spare(pins, count)
     balls[count.+(1)] ? @sum[pins] + balls[count.+(1)].first : @sum[pins]
  end
end