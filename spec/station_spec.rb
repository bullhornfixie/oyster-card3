require 'station'

describe Station do 

  it 'Knows its name' do
    expect(subject.name).to eq("Dummy")
  end
  
  it 'Knows its zone' do
    expect(subject.zone).to eq(1)
  end
  
end