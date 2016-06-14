class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :'tweets/create_tweet'
  end

end
