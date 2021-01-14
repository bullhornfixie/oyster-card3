class Oystercard
  attr_reader :balance, :in_journey, :journeys

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if limit_reached?(amount)
    @balance += amount
  end

  def limit_reached?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MINIMUM_BALANCE
    @journeys << { entry_station: station, exit_station: "" }
  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @journeys[-1][:exit_station] = station
  end

  def in_journey?
    !@journeys[-1][:entry_station].nil?
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
