require_relative './station.rb'

class Journey

  attr_reader :entry_station, :exit_station
  NORMAL_FARE = 2

  def initialize(station = Station)
    @station = station
  end
  def start(station)
    @entry_station = station
  end
  
  def finish(station)
    @exit_station = station
  end

  def fare
    NORMAL_FARE
  end

  def complete?
    !!@entry_station && !!@exit_station
  end
  
end