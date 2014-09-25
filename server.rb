require 'sinatra/base'
require 'rack-flash'

Dir[File.join(__dir__, 'lib', '*.rb')].each {|file| require file }

class ClothingEStore < Sinatra::Base

  enable :sessions
  use Rack::Flash

  product_file = 'data_files/products.txt'
  voucher_file = 'data_files/vouchers.txt'
  
  product_array = ObjectLoader.products_from(product_file)
  voucher_array = ObjectLoader.vouchers_from(voucher_file)

  CART     = ShoppingCart.new
  PRODUCTS = DatabaseTable.new( product_array )
  VOUCHERS = DatabaseTable.new( voucher_array )

  get '/' do
    @products = PRODUCTS.all
    @cart     = CART
    @vouchers = VOUCHERS.all
    
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
    
    voucher.apply_to(CART)

    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
