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
        # binding.pry
        if game = Game.find_by(title: params[:title])
            current_user.games << game
            redirect '/games'
        else
            game = Game.new(params)
            if game.save
                current_user.games << game
                redirect '/games'
            else
                redirect '/games/new'
            end
        end
        # binding.pry

    end

#show
    get "/games/:id" do
        # binding.pry
        @game = current_user.games.find_by(params)
        erb :"games/show"
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