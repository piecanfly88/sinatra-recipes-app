class UsersController < ApplicationController

    get "/signup" do
        if_logged_in_redirect
        erb :create_users
    end

    post "/users" do
        @user = User.new(params)

        if params[:username] != "" && params[:email] != "" && params[:password] != ""
            @user.save
            session[:user_id] = @user.id
            
            erb :'/users/show'
        else
            flash[:warning] = "Invalid username, password or email, please try again."            
            redirect '/signup'
        end
    end

    get "/login" do
        if_logged_in_redirect
        erb :'users/login'
    end

    post "/login" do 
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            
            redirect "/users/#{@user.id}"
        else
            flash[:warning] = "Invalid username or password, please try again."
            redirect '/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        if_not_logged_in_redirect

        erb :'/users/show'
    end

    get '/logout' do
        session.clear

        redirect '/'
    end
end