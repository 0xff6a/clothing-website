require 'object_loader'

describe ObjectLoader do
  
  let(:data_string)  { '(0%Mid Twist Cut-Out Dress, Pink%Women’s Formalwear%£540.00%5)'           }
  let(:data_string2) { '(2%15.0%if you spend over £75 on footwear%total > 75,has_footwear_item?)' }

  context '#products_from' do

    it 'can create an array of products from a data file' do
      expect(File).to receive(:read).and_return(data_string)
      product = ObjectLoader.products_from('dummy.txt').first
      expect(product.price).to eq 540.00
    end
  
  end

  context '#vouchers_from' do

    it 'can create an array from vouchers from a data file' do
      expect(File).to receive(:read).and_return(data_string2)
      voucher = ObjectLoader.vouchers_from('dummy.txt').first
      expect(voucher.conditions).to eq ['total > 75', 'has_footwear_item?']
    end

  end

end