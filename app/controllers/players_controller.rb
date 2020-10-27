class PlayersController < ApplicationController

# new
    get "/signup" do
        erb :'players/new'
    end

    post "/players" do
        player = Player.new(
            name: params[:player][:name],  
            email: params[:email].downcase,  
            password: params[:password],  
            gamer_tag: params[:player][:gamer_tag],
            preferred_platform: params[:player][:preferred_platform]
        )
        if player.save
            session[:user_id] = player.id
            redirect '/games'
        else
            redirect '/signup'
        end
        
    end

end