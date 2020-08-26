class RecipesController < ApplicationController

    get '/recipes' do
        @recipes = Recipe.all

        erb :'/recipes/index'
    end

    get '/recipes/new' do
        if_not_logged_in_redirect

        erb :'/recipes/create_recipe'
    end

    post '/recipes' do
        @recipe = Recipe.create(title: params[:title], user_id: current_user.id, ingredients: params[:ingredients], instructions: params[:instructions])

        redirect "/recipes/#{@recipe.id}"
    end
    
    get '/recipes/:id' do
        @recipe = Recipe.find_by(id: params[:id])

        erb :'/recipes/show'
    end

    get '/recipes/:id/edit' do
        if_not_logged_in_redirect

        @recipe = Recipe.find(params[:id])

        if authorized_to_edit?(@recipe)
            erb :'/recipes/edit'
        else
            redirect "/users/#{current_user.id}"
        end

       
    end

    patch '/recipes/:id' do
        if_not_logged_in_redirect

        @recipe = Recipe.find(params[:id])

        @recipe.update(title: params[:title], ingredients: params[:ingredients], instructions: params[:instructions])

        redirect "/recipes/#{@recipe.id}"
    end 

    delete '/recipes/:id' do
        @recipe = Recipe.find(params[:id])
        
        @recipe.destroy

        redirect '/users/show'
    end
    
end