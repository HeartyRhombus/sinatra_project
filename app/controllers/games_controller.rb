class GamesController < ApplicationController

# index
    get "/games" do
        if logged_in?
            current_user.games
            erb :'games/index'
        else
            redirect '/login'
        end
    end

# new
    get "/games/new" do
        if logged_in?
            erb :'games/new'
        else
            redirect '/login'
        end
    end

    post "/games" do
        if game = Game.find_by(title: params[:title].downcase)
            current_user.games << game
            redirect '/games'
        else
            params[:title].downcase!
            game = current_user.games.create(params)
            if game.save
                redirect "/games"
            else
                redirect '/games/new'
            end
        end

    end

#show
    get "/games/:id" do
        if logged_in?
            @game = current_user.games.find_by(params)
            erb :"games/show"
        else
            redirect '/login'
        end
    end

# edit
    get "/games/:id/edit" do
        if logged_in?
            @game = current_user.games.find_by(params)
            erb :"games/edit"
        else
            redirect '/login'
        end
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
        if logged_in?
            game = current_user.games.find_by(id: params[:id])
            current_user.games.delete(game)
            redirect '/games'        
        else
            redirect '/login'
        end
    end

end