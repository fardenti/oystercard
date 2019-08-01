class Journey

  attr_reader :entry_station, :exit_station

  def start(station)
    @entry_station = station
  end
  
  def finish(station)
    @exit_station = station
  end

  def fare
    2
  end

  def complete?
    !!@entry_station && !!@exit_station
  end
  
end