class Oystercard

  attr_reader :balance, :entry_station, :journey_history, :current_journey
  MAX_VALUE = 90
  MIN_VALUE = 1
  PENALTY_FARE = 8

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    fail "top up amount has exceeded limit of £#{MAX_VALUE}" if (@balance + amount) > MAX_VALUE
    @balance += amount
  end

  def in_journey?
   !!@current_journey.complete?
  end

  def touch_in(station)
    fail "Your card balance is below £#{MIN_VALUE}, please top up" if @balance < MIN_VALUE
    deduct(PENALTY_FARE) unless @current_journey.complete?
    @journey_history << @current_journey unless @current_journey.complete?
    @current_journey = Journey.new
    @current_journey.start(station)
    
  end
  
  def touch_out(station)
    fail 'you havent started your journey yet, please touch in card to start journey' unless in_journey?
    deduct(FARE_AMOUNT)
    @current_journey = {:entry => @entry_station, :exit => station}
    @journey_history << @current_journey
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
