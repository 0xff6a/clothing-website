require 'sinatra/base'
Dir[File.join(__dir__, 'lib', '*.rb')].each {|file| require file }

class ClothingEStore < Sinatra::Base

  DATA_FILE = 'products.txt'
  PRODUCTS = ProductLoader.products_from(DATA_FILE)
  
  get '/' do
    @products = PRODUCTS
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
