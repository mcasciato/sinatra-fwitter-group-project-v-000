class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'/users/create_user'
    else
      redirect to '/tweets'
    end
  end

  post '/signup' do
    if params[:password] == ""
      redirect '/signup'
    end
    user = User.new(params)
    if user.username != "" && user.email != ""
      user.save
      session[:user_id] = user.id
      redirect to "/tweets"
    else
      redirect to '/signup'
    end
  end
end
