require 'sinatra/base'

class Birthday < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/greeter' do
    @name = params[:name]
    @birthday = params[:birthday]
    # p @birthday
    @birthday = Date.strptime(@birthday, "%d/%m/%Y")
    # Date.strptime('25/04/14', '%d/%m/%y')
    # p @birthday
    erb :greet
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
