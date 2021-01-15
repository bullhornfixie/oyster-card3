class Journey 
  attr_reader :entry_station, :exit_station 
  
  MINIMUM_BALANCE = 1
  PENALTY_FARE = 6
    
  def initialize(entry_station=nil)
    @entry_station = entry_station
  end
  
  def finish(exit_station=nil)
    @exit_station = exit_station
  end 
  
  def calculate_fare
    @entry_station != nil && @exit_station != nil ? MINIMUM_BALANCE : PENALTY_FARE
  end
  
end