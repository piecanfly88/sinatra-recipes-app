class RecipesController < ApplicationController

    get '/recipes' do
        @recipes = Recipe.all

        erb :'/recipes/index'
    end

    get '/recipes/new' do
        erb :'/recipes/create_recipe'
    end

    post '/recipes' do
        @recipe = Recipe.create(title: params[:title], ingredients: params[:ingredients], instructions: params[:instructions])

        redirect "/recipes/#{@recipe.id}"
    end
    
    get '/recipes/:id' do
        @recipe = Recipe.find_by(id: params[:id])

        erb :'/recipes/show'
    end

    get '/recipes/:id/edit' do
        @recipe = Recipe.find(params[:id])

        erb :'/recipes/edit'
    end

    patch '/recipes/:id' do
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