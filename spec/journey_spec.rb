require 'journey'
require 'oystercard'

describe Journey do 
  let(:entry_station) { double :entry_station }
  let(:exit_station)  { double :exit_station }
  
  context 'When initializing an Journey' do
    it { is_expected.to respond_to(:entry_station) }
  end
  
  context 'When finishing a journey' do 
    it { is_expected.to respond_to(:exit_station) }
    it { is_expected.to respond_to(:finish) }
  end
  
  describe 'calculate_fare' do 
    it { is_expected.to respond_to(:calculate_fare) }
    
    it 'Should return minimum fare on completion of a journey' do 
      start = Journey.new(entry_station)
      start.finish(exit_station)
      expect(start.calculate_fare).to eq(Oystercard::MINIMUM_BALANCE)
    end
  end
 
end
