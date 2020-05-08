class RecipesController < ApplicationController

    get '/recipes' do
        @recipes = Recipe.all

        erb :'/recipes/index'
    end

    get '/recipes/new' do
        erb :'/recipes/create_recipe'
    end

    
end