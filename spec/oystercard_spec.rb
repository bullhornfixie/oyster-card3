require "oystercard"

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it "tops up the balance" do
    subject.topup(4)
    expect(subject.balance).to eq(4)
  end

  it 'limits the balance to a maximum of £90' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.topup(maximum_balance)
    expect { subject.topup(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

end
