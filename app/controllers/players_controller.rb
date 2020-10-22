class PlayersController < ApplicationController
    # index
    get "/players" do
        erb :'players/index'
    end

# new
    get "/players/new" do
        erb :'players/new'
    end

    post "/players" do
        
    end

#show
    get "/players/:id" do
        erb :"players/#{@player.id}"
    end

# edit
    get "/players/:id/edit" do
        erb :"players/edit"
    end

    patch "/players/:id" do
        
    end

#delete
    delete "/players/:id" do
        
    end

end