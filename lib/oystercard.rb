class Oystercard
  attr_reader :balance, :in_journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def topup(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if limit_reached?(amount)
    @balance += amount
  end

  def in_journey?
    @in_journey
  end
  
  def touch_in(station)
    raise "Not enough funds" if @balance < MINIMUM_BALANCE
    @in_journey = true

  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_journey = false
  end

  private
  
  def deduct(amount)
    @balance -= amount
  end

  def limit_reached?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def difference
    MAXIMUM_BALANCE - @balance
  end
end
