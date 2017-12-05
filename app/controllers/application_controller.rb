class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new_recipe
  end

  post '/recipes' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "recipe/#{recipe.id}"
  end

  get 'recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
end
