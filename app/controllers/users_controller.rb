class UsersController < ApplicationController

    get "/signup" do
        erb :create_users
    end

    post "/signup" do
        @user = User.new(params)

        if @user.save
            session[:user_id] = @user.id
        else
            redirect to "/create_users"
        end
    end
end