class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect to '/login'
    end
  end

  get '/tweets/new' do
    if !logged_in?
      redirect "/login"
    else
    erb :'tweets/create_tweet'
    end
  end

  post '/tweets' do
    if !logged_in?
      redirect "/tweets"
    end
  end

  get '/tweets/:slug' do
    if !logged_in?
      redirect "/login"
    else
      erb :'tweets/show_tweet'
    end
  end

  get '/tweets/:slug/edit' do
   if logged_in?
    @tweet = Tweet.find_by_id(params[:id])
      if @tweet.user_id == session[:user_id]
       erb :'tweets/edit_tweet'
      else
        redirect to '/tweets'
      end
    else
      redirect to '/login'
    end
  end

  post '/tweets/slug' do
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.content = params[:content]
    @tweet.save

    redirect to "/tweets/#{@tweet.slug}"
  end
 


end

