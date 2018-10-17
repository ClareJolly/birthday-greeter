require 'sinatra/base'
require './lib/datechecker'

class Birthday < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/greeter' do
    @name = params[:name]
    day = params[:day]
    month = params[:month]
    @datecheck = DateChecker.new
    @datecheck.format_birthday(day, month)
    erb :greet
  end

  run! if app_file == $0
end
