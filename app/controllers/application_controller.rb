require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_super_duper_secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def if_not_logged_in_redirect
      if !logged_in?
        redirect '/'
      end
    end

    def if_logged_in_redirect
      if logged_in?
        redirect "/users/#{current_user.id}"
      end
    end

  end

end
