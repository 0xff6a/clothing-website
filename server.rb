require 'sinatra/base'
Dir[File.join(__dir__, 'lib', '*.rb')].each {|file| require file }

class ClothingEStore < Sinatra::Base

  DATA_FILE = 'products.txt'
  PRODUCTS = ProductLoader.products_from(DATA_FILE)
  CART = ShoppingCart.new
  
  get '/' do
    @products = PRODUCTS
    @cart = CART
    erb :index
  end

  get '/cart/update/:id' do
    CART.add(find_product(params[:id].to_i).pop_single!)
    redirect '/'
  end

  get '/cart/remove/:id' do
    CART.remove(find_product(params[:id].to_i).pop_single!)
    redirect '/'
  end

  def find_product(id)
    PRODUCTS.select{ |product| product.id == id }.first
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
