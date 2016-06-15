class TweetsController < ApplicationController

  get '/tweets' do
    if !logged_in?
      redirect to '/login'
    else
      @user = current_user
      @tweets = Tweet.all
      erb :'/tweets/tweets'
    end
  end

  get '/tweets/new' do
    if !logged_in?
      redirect to '/login'
    else
      erb :'/tweets/create_tweet'
    end
  end

  post '/tweets' do
    @user = current_user
    @tweet = Tweet.create(content: params[:content])
      if @tweet.save
      redirect to "/tweets/#{@tweet.id}"
    else
      redirect to '/tweets/new'
    end
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'/tweets/show_tweet'
    else
      redirect to '/login'
    end
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find_by_id(params[:id])
    if logged_in?
      if current_user.id == @tweet.user_id
      erb :'/tweets/edit_tweet'
      else
      redirect to '/tweets'
      end
    else
      redirect to '/login'
    end
  end

  post '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    if params[:content].empty?
      redirect to "/tweets/#{@tweet.id}/edit"
    else
      @tweet.update(content: params[:content], user_id: params[:user_id])
      redirect to "/tweets/#{@tweet.id}"
    end
  end

  delete '/tweets/:id/delete' do
    @tweet = Tweet.find_by_id(params[:id])
    if @tweet.user_id == current_user.id && @tweet.delete
      redirect '/tweets'
    else
      redirect "/tweets/#{@tweet.id}"
    end
  end
end
