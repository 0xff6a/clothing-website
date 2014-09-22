require 'product'

describe Product do
  
  let(:product) { Product.new('Name', 'Cat', 99.0, 5) }

  context 'initialisation' do

    it 'should have a name' do
      expect(product.name).to eq 'Name'
    end

    it 'should have a category' do
      expect(product.category).to eq 'Cat'
    end

    it 'should have a price' do
      expect(product.price).to eq 99.0
    end

    it 'should have a stock' do
      expect(product.stock).to eq 5
    end
  
  end

end