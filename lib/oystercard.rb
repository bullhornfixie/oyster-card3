class Oystercard
  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def topup(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if limit_reached?(amount)
    @balance += amount
  end

  private

  def limit_reached?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def difference
    MAXIMUM_BALANCE - @balance
  end
end
