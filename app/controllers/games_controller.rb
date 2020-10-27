class GamesController < ApplicationController

# index
    get "/games" do
        if logged_in?
            current_user
        end
        erb :'games/index'
    end

# new
    get "/games/new" do
        erb :'games/new'
    end

    post "/games" do
        if game = Game.find_by(title: params[:title].downcase)
            current_user.games << game
            redirect '/games'
        else
            params[:title].downcase!
            game = current_user.games.create(params)
            if game.save

                redirect '/games'
            else
                redirect '/games/new'
            end
        end

    end

#show
    get "/games/:id" do
        @game = current_user.games.find_by(params)
        erb :"games/show"
    end

# edit
    get "/games/:id/edit" do
        @game = current_user.games.find_by(params)
        erb :"games/edit"
    end

    patch "/games/:id" do
        @game = current_user.games.find_by(id: params[:id])
        @game.title = params[:title]
        @game.platform = params[:platform]
        @game.release_date = params[:release_date]
        @game.rating = params[:rating]
        @game.description = params[:description]
        if @game.save
            redirect "/games/#{@game.id}"
        else
            redirect "/games/:id/edit"
        end
    end

#delete
    delete "/games/:id" do
        game = current_user.games.find_by(id: params[:id])
        current_user.games.delete(game)
        redirect '/games'        
    end

end