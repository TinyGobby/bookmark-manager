require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'

# This is the controller for our Bookmark app
class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  get '/add' do
    erb(:add)
  end

  post '/add' do
    flash[:fail] = 'Incorrect URL' unless Bookmark.create(params[:title], params[:url])
    redirect('/bookmarks')
  end

  run! if app_file == $PROGRAM_NAME
end
