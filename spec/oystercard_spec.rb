require 'oystercard'

describe Oystercard do
  let(:minimum) { Oystercard::MINIMUM_BALANCE }
  let(:maximum) { Oystercard::MAXIMUM_BALANCE }
  let(:station) { double :station }
  
  context 'When initializing an Oystercard' do
    it { is_expected.to respond_to(:balance) }                            
    it { is_expected.to respond_to(:in_journey) }
    it { is_expected.to respond_to(:entry_station) }

    it 'Should have a balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end
  
  describe 'top_up' do
    it 'Increases the balance of the card' do
      subject.top_up(10)
      expect(subject.balance).to eq(10)
    end
    
    it 'Raises an error when a top up exceeds the maximum balance' do
      expect { subject.top_up(91) }.to raise_error "Maximum balance of #{maximum} exceeded"
    end
  end
  
  describe 'deduct' do
    it 'Deducts fare from card balance' do
      subject.top_up(maximum)
      subject.send(:deduct, minimum) # syntax for private method access
      expect(subject.balance).to eq(89)
    end
  end
  
  describe 'touch_in' do 
    before(:each) do
      subject.top_up(minimum)
      subject.touch_in(station)
    end
    
    it 'Updates the in_journey instance variable to true' do
      expect(subject).to be_in_journey 
    end
  
    it 'Remembers the entry station on touch in' do 
      expect(subject.entry_station).to eq "Unknown"
    end
  end
  
  describe 'touch_in error' do
    it 'Card needs to have minimum balance of £1 to travel' do
      expect { subject.touch_in(station) }.to raise_error "Insufficient funds"
    end
  end
    
  describe 'touch_out' do 
    before(:each) do
      subject.top_up(10)
      subject.touch_out
    end
    
    it 'Updates the in_journey instance variable to false' do
      expect(subject).not_to be_in_journey 
    end
    
    it 'Reduces the balance by minimum fare on touching out' do
      expect { subject.touch_out }.to change{ subject.balance }.by(-minimum)
    end
    
    it 'Forgets the entry_station on touch out' do
      expect(subject.entry_station).to eq nil
    end
  end

  describe 'in_journey?' do 
    it 'Returns true of false based on journey status' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(true)
    end
  end
  
end


