class PlayersController < ApplicationController

# new
    get "/signup" do
        erb :'players/new'
    end

    post "/players" do
        binding.pry
        redirect '/games'
    end

end