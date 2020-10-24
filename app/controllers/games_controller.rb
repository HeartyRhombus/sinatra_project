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
        if game = Game.find_by(title: params[:title].downcase)
            current_user.games << game
            redirect '/games'
        else
            # binding.pry
            params[:title].downcase!
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
        @game = current_user.games.find_by(params)
        # binding.pry
        erb :"games/edit"
    end

    patch "/games/:id" do
        @game = current_user.games.find_by(id: params[:id])
        @game.title = params[:title]
        @game.platform = params[:platform]
        @game.release_date = params[:release_date]
        @game.rating = params[:rating]
        @game.description = params[:description]
        # binding.pry
        if @game.save
            redirect "/games/#{@game.id}"
        else
            redirect "/games/:id/edit"
        end
    end

#delete
    delete "/games/:id" do
        # binding.pry
        game = current_user.games.find_by(id: params[:id])
        current_user.games.delete(game)
        redirect '/games'        
    end

end