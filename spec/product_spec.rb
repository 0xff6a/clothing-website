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

  context '#in_stock?' do

    it 'should know if a product is in stock' do
      expect(product).to be_in_stock
    end

    it 'should know if a product is in stock' do
      sold_out = Product.new('Name', 'Cat', 99.0, 0)
      expect(sold_out).not_to be_in_stock
    end

  end

end