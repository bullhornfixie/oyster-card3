require "oystercard"

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end
  
  it "tops up the balance" do
    subject.topup(4)
    expect(subject.balance).to eq(4)
  end
  
end

