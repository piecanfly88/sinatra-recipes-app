class UsersController < ApplicationController

    get "/signup" do
        erb :create_users
    end

    post "/users" do
        @user = User.new(params)

        if params[:username] != "" && params[:email] != "" && params[:password] != ""
            @user.save
            session[:user_id] = @user.id
            
            erb :'/users/show'
        else
            redirect '/signup'
        end
    end
end