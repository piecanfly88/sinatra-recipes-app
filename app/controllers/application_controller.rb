require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_super_duper_secret"
    register Sinatra::Flash
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
        flash[:warning] = "You must be logged in for this functionality"        
        redirect '/'
      end
    end

    def if_logged_in_redirect
      if logged_in?
        redirect "/users/#{current_user.id}"
      end
    end

    def authorized_to_edit?(recipe)
      recipe.user == current_user 
    end

  end

end
