class TweetsController < ApplicationController

<<<<<<< HEAD
<<<<<<< HEAD
  get '/tweets' do
    "hello world"
=======
# <<<<<<< HEAD
# =======
# <<<<<<< HEAD
  get '/tweets' do
    "hello world" 
>>>>>>> 9fdfbb7333866271c70088a260621d5353fb3291
    erb :'tweets/tweets'
  end

  post '/tweets' do
    "hello world"
  end
<<<<<<< HEAD
  
=======

>>>>>>> 9fdfbb7333866271c70088a260621d5353fb3291
  get '/tweets/create_tweet' do
    if logged_in?.empty?
      redirect "/users/login"
    else
      erb :'tweets/create_tweet'
    end
  end
<<<<<<< HEAD
end
=======
=======
# =======
# >>>>>>> 73185dec98942c2be5a5e29bcc88765a1e5677fd
>>>>>>> 9fdfbb7333866271c70088a260621d5353fb3291
  get '/tweets/new' do
    erb :'tweets/create_tweet'
  end

end
<<<<<<< HEAD
>>>>>>> 98492d5eccd0078cc4f3572fe93844596fd67123
=======
# <<<<<<< HEAD
# =======
# >>>>>>> 98492d5eccd0078cc4f3572fe93844596fd67123
# >>>>>>> 73185dec98942c2be5a5e29bcc88765a1e5677fd
>>>>>>> 9fdfbb7333866271c70088a260621d5353fb3291
