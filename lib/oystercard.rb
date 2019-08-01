require_relative './journey.rb'

class Oystercard

  attr_reader :balance, :entry_station, :journey_history, :current_journey
  MAX_VALUE = 90
  MIN_VALUE = 1
  PENALTY_FARE = 8

  def initialize(journey_class = Journey)
    @balance = 0
    @journey_history = []
    @journey_class = journey_class
  end

  def top_up(amount)
    fail "top up amount has exceeded limit of £#{MAX_VALUE}" if (@balance + amount) > MAX_VALUE
    @balance += amount
  end

  def in_journey?
   !!@current_journey
  end

  def touch_in(station)
    balance_check
    touch_in_check
    @current_journey = @journey_class.new
    @current_journey.start(station) 
  end
  
  def touch_out(station)
    touch_out_check
    @current_journey.finish(station)
    @journey_history << @current_journey
    @current_journey = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  def touch_in_check
    if @current_journey
      deduct(PENALTY_FARE)
      @journey_history << @current_journey
    end
  end

  def touch_out_check
    if !@current_journey
      deduct(PENALTY_FARE)
      @current_journey = @journey_class.new
    else
      deduct(@current_journey.fare)
    end
  end

  def balance_check
    fail "Your card balance is below £#{MIN_VALUE}, please top up" if @balance < MIN_VALUE
  end

end
