require 'shopping_cart'

describe ShoppingCart do
   
  let(:cart)    { ShoppingCart.new                                                  }
  let(:product) { double Product, id: 0, stock: 5, :stock= => nil, stock_value: 10  }
  let(:single)  { double Product, id: 0, stock: 1, :stock= => nil                   }

  context 'initialisation' do
  
    it 'should have no products initially' do
      expect(cart.products).to eq []
    end 

    it 'should have no discount initially' do
      expect(cart.discount).to eq 0
    end

  end

  context '#clear_discounts' do

    it 'can clear discounts from a cart' do
      cart.discount = 10
      cart.clear_discounts
      expect(cart.discount).to eq 0
    end

  end

  context '#add' do

    it 'a product can be added to the cart' do
      cart.add(product)
      expect(cart.products).to eq [product]
    end

    it 'if a product is already in the cart, only the stock is updated' do
      expect(product).to receive(:stock=).with(10)
      2.times { cart.add(product) }
      expect(cart.products).to eq [product]
    end

  end

  context '#remove' do

    it 'a product can be removed' do
      allow(product).to receive(:stock).and_return(0)
      cart.add(product)
      cart.remove(product)
      expect(cart.products).to eq []
    end

    it 'a product cannot be removed if it is not in the cart' do
      expect { cart.remove(product) }.to raise_error(RuntimeError, 
          'Error:product is not in the cart')
    end

    it 'if less stock of a product is removed only the value is updated' do
      expect(product).to receive(:stock=).with(4)
      cart.add(product)
      cart.remove(single)
    end

  end

  context '#total' do
    
    it 'the total price of products can be calculated' do
      2.times{ cart.add(product) }
      expect(cart.total).to eq 10
    end

  end

  context '#has_footwear_item' do

    it 'should know if the shopping cart contains products in the footwear category' do
      shoe = double Product, id: 1, stock: 5, category: "Men's Footwear"
      cart.add(shoe)
      expect(cart).to have_footwear_item
    end

  end

end