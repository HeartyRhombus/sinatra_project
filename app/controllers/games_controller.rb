class GamesController < ApplicationController

# index
    get "/games" do
        # binding.pry
        if logged_in?
            current_user
        end
        # current_user.games
        erb :'games/index'
    end

# new
    get "/games/new" do
        erb :'games/new'
    end

    post "/games" do
        
    end

#show
    get "/games/:id" do
        erb :"games/#{@game.id}"
    end

# edit
    get "/games/:id/edit" do
        erb :"games/edit"
    end

    patch "/games/:id" do
        
    end

#delete
    delete "/games/:id" do
        
    end

end