require 'sinatra/base'
Dir[File.join(__dir__, 'lib', '*.rb')].each {|file| require file }

class ClothingEStore < Sinatra::Base
  
  get '/' do
    'Hello ClothingEStore!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
