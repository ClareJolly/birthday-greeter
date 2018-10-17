require 'sinatra/base'

class Birthday < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/greeter' do
    'Name: Clare, Birthday: 30/09/1978'
    # erb :greet
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
