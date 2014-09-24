require 'sinatra/base'
require 'rack-flash'

Dir[File.join(__dir__, 'lib', '*.rb')].each {|file| require file }

class ClothingEStore < Sinatra::Base

  enable :sessions
  use Rack::Flash

  DATA_FILE = 'products.txt'
  
  PRODUCTS = ProductLoader.products_from(DATA_FILE)
  CART = ShoppingCart.new
  
  VOUCHERS = 
  [
    Voucher.new(0, 5.0, 'for being a loyal customer'),
    Voucher.new(1, 10.0, 'if you spend over £50', 'total > 50'),
    Voucher.new(2, 15.0, 'if you spend over £75 on footwear' , 'total > 75', 'has_footwear_item?' )
  ]
  
  get '/' do
    @products = PRODUCTS
    @cart = CART
    @vouchers = VOUCHERS
    
    erb :index
  end

  get '/cart/update/:id' do
    product = find_product(params[:id])

    if product.in_stock?
      CART.add(product.pop_single)
    else
      flash[:error] = 'The selected product is out of stock'
    end

    redirect '/'
  end

  get '/cart/remove/:id' do
    CART.remove(find_product(params[:id]).push_single)
    
    redirect '/'
  end

  get '/voucher/redeem/:id' do

    redirect '/'
  end

  def find_product(id)
    PRODUCTS.select{ |product| product.id == id.to_i }.first
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
