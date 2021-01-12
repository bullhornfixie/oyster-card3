require "oystercard"

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  context "topup" do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    before do
      subject.topup(maximum_balance)
    end
    
    it "the balance" do
      expect(subject.balance).to eq(90)
    end
    
    it 'limits the balance to a maximum of £90' do
      expect { subject.topup(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end

end

  it 'is initially not in a journey' do
    expect(subject.in_journey).not_to be true
  end

  context 'travelling' do
  let(:station ){ double :station }
    it "can check journey staus of card" do
      expect(subject.in_journey?).to be(true).or be(false)
    end 

    it "will raise error if you do not have enough funds" do
      expect{ subject.touch_in }.to raise_error "Not enough funds"
    end

    it "will record the entry station where you touch in" do
      
      subject.touch_in(station)
       expect(subject.entry_station).to eq station
    end

    it "will deduct fare when touching out" do
      expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
    end
  end
end
