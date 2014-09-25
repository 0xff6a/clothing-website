require 'product'

describe Product do
  
  let(:product) { Product.new(0, 'Name', 'Cat', 99.0, 5) }

  context 'initialisation' do

    it 'should have an id' do
      expect(product.id).to eq 0
    end

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

    it 'should know if a product is not in stock' do
      sold_out = Product.new(1,'Name', 'Cat', 99.0, 0)
      expect(sold_out).not_to be_in_stock
    end

  end

  context '#stock_value' do

    it 'should know the value of the stock' do
      expect(product.stock_value).to eq (5 * 99.0)
    end

  end

  context '#formatted_price' do

    it 'should display a price as £xxx.xx' do
      expect(product.formatted_price).to eq '£99.00'
    end

  end

  context '#pop_single' do

    it 'return a single copy of the product and decrements the stock of the original' do
      expect(product.pop_single.stock).to eq 1
      expect(product.stock).to eq 4
    end

  end

  context '#push_single' do

    it 'return a single copy of the product and increments the stock of the original' do
      expect(product.push_single.stock).to eq 1
      expect(product.stock).to eq 6
    end

  end

end