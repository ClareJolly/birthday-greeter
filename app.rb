require 'sinatra/base'
require './lib/datechecker'

class Birthday < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/greeter' do
    @name = params[:name]
    day = params[:day]
    month = params[:month]
    @datecheck = DateChecker.new
    @datecheck.format_birthday(day, month)
    # p @datecheck.date_diff
    # p "dsaas"

    # @birthday = "#{ @month}/#{@month}/#{Date.today.year}"
    # @birthday = Date.strptime(@birthday, "%d/%m/%Y")
    erb :greet
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
