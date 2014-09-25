require 'sinatra/base'
require 'rack-flash'

Dir[File.join(__dir__, 'lib', '*.rb')].each {|file| require file }

class ClothingEStore < Sinatra::Base

  enable :sessions
  use Rack::Flash

  DATA_FILE = 'products.txt'
  
  product_data = ProductLoader.products_from(DATA_FILE)
  voucher_data = 
  [
    Voucher.new(0, 5.0, 'for being a loyal customer'),
    Voucher.new(1, 10.0, 'if you spend over £50', 'total > 50'),
    Voucher.new(2, 15.0, 'if you spend over £75 on footwear' , 'total > 75', 'has_footwear_item?' )
  ]

  CART     = ShoppingCart.new
  PRODUCTS = DatabaseTable.new( product_data )
  VOUCHERS = DatabaseTable.new( voucher_data )

  get '/' do
    @products = PRODUCTS.rows
    @cart     = CART
    @vouchers = VOUCHERS.rows
    
    erb :index
  end

  get '/cart/update/:id' do
    product = PRODUCTS.find(params[:id])

    if product.in_stock?
      CART.add(product.pop_single)
    else
      flash[:error] = 'The selected product is out of stock'
    end

    redirect '/'
  end

  get '/cart/remove/:id' do
    product = PRODUCTS.find(params[:id])

    CART.remove(product.push_single)
    
    redirect '/'
  end

  get '/voucher/redeem/:id' do
    voucher = VOUCHERS.find(params[:id])
    
    CART.redeem(voucher)

    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
