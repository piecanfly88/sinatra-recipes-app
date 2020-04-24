class UsersController < ApplicationController

    get "/signup" do
        erb :create_users
    end
end