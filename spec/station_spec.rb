require 'station'

describe Station do 
  subject { described_class.new }
  let(:station1) { described_class.new("Dummy", 1) }
  let(:station2) { described_class.new("Victoria", 1) }

  context "create fake instances of Station class and extract data" do
  
    it 'Returns name of Station 1' do
      expect(station1.name).to eq("Dummy")
    end
  
    it 'Returns zone of Station 1' do
      expect(station1.zone).to eq(1)
    end
  
    it 'Returns name of Station 2' do
      expect(station2.name).to eq("Victoria")
    end
    
    it 'Returns name of Station 2' do
      expect(station2.zone).to eq(1)
    end

  end
end
