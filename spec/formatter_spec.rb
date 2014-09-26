require 'formatter'

class TestHelper; include Formatter; end

describe 'Formatter' do

  let(:formatter) { TestHelper.new }

  it 'can format a price' do
    expect(formatter.format_ccy(10)).to eq '£10.00'
  end

end