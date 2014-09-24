require 'voucher'

describe Voucher do   

  let(:voucher)     { Voucher.new(5.0)                                              }
  let(:big_voucher) { Voucher.new(10, 'total > 10')                                 }
  let(:cart)        { double ShoppingCart, total: 80, :has_footwear_item? => false  }

  context 'intialisation' do
    
    it 'should have a discount' do
      expect(voucher.discount).to eq 5.0
    end
    
    it 'should have conditions' do
      expect(big_voucher.conditions).to eq ['total > 10']
    end

  end

  context '#valid_for' do

    it 'should know if a voucher is valid for a given shopping cart' do
      expect(big_voucher.valid_for(cart)).to be true
    end

    it 'should know if a voucher is not valid for a given shopping cart' do
      complex_voucher = Voucher.new(15, 'total > 75', 'has_footwear_item?')
      expect(complex_voucher.valid_for(cart)).to be false
    end

  end

end