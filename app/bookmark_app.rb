require 'sinatra/base'
require './lib/bookmark'

# This is the controller for our Bookmark app
class BookmarkApp < Sinatra::Base
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
    Bookmark.create(url: params['url'])
    redirect('/bookmarks')
  end

  run! if app_file == $PROGRAM_NAME
end
