require 'oystercard'

describe Oystercard do
  
  let(:minimum) { Oystercard::MINIMUM_BALANCE }
  let(:maximum) { Oystercard::MAXIMUM_BALANCE }
  
  context 'When initializing an Oystercard' do
    it { is_expected.to respond_to(:balance) }                            
    it { is_expected.to respond_to(:in_journey) }
    
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
    
    it 'Updates the in_journey instance variable to true' do
      subject.top_up(minimum)
      subject.touch_in
      expect(subject).to be_in_journey 
    end
  
    it 'Need to have minimum balance of £1 to travel' do
      expect { subject.touch_in }.to raise_error "Insufficient funds"
    end
  end
    
  describe 'touch_out' do 
    
    it 'Updates the in_journey instance variable to false' do
      subject.top_up(10)
      subject.touch_out
      expect(subject).not_to be_in_journey 
    end
    
    it 'Reduces the balance by minimum fare on touching out' do
      subject.top_up(10)
      subject.touch_out
      expect { subject.touch_out }.to change{ subject.balance }.by(-minimum)
    end
  end

  describe 'in_journey?' do 
    
    it 'Returns true of false based on journey status' do
      subject.top_up(10)
      subject.touch_in
      expect(subject.in_journey?).to eq(true)
    end
  end
  
end


