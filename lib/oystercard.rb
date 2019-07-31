class Oystercard

  attr_reader :balance, :entry_station
  MAX_VALUE = 90
  MIN_VALUE = 1
  FARE_AMOUNT = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "top up amount has exceeded limit of £#{MAX_VALUE}" if (@balance + amount) > MAX_VALUE
    @balance += amount
  end

  def in_journey?
   !!@entry_station
  end

  def touch_in(station)
    fail "Your card balance is below £#{MIN_VALUE}, please top up" if @balance < MIN_VALUE
    @entry_station = station
  end
  
  def touch_out
    fail 'you havent started your journey yet, please touch in card to start journey' unless in_journey?
    deduct(FARE_AMOUNT)
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
