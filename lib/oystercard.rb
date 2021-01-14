class Oystercard
  attr_reader :balance, :in_journey

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if limit_reached?(amount)
    @balance += amount
  end

  def limit_reached?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end
  
  def touch_in
    raise "Insufficient funds" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end
  
  def touch_out
    @in_journey = false 
    deduct(MINIMUM_BALANCE)
  end
  
  def in_journey?
    @in_journey
  end
  
  private
  
  def deduct(amount)
    @balance -= amount
  end

end
