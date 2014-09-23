require 'shopping_cart'

describe ShoppingCart do
   
  let(:cart)    { ShoppingCart.new                  }
  let(:product) { double Product, stock_value: 5    }

  context 'initialisation' do
  
    it 'should have no products initially' do
      expect(cart.products).to eq []
    end 
  end

  context '#add' do

    it 'a product can be added to the cart' do
      cart.add(product)
      expect(cart.products).to eq [product]
    end

  end

  context '#pop_product' do

    xit 'should return a single stock product from those in the cart' do
    end

  end

  context '#remove' do

    it 'a product can be removed' do
      cart.add(product)
      cart.remove(product)
      expect(cart.products).to eq []
    end

    it 'a product cannot be removed if it is not in the cart' do
      expect { cart.remove(product) }.to raise_error(RuntimeError, 
          'Error:product is not in the cart')
    end

  end

  context '#total' do
    
    it 'the total price of products can be calculated' do
      2.times{ cart.add(product) }
      expect(cart.total).to eq 10
    end

  end

end