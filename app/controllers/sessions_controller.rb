class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        player = Player.find_by(email: params[:player][:email].downcase)
        if player && player.authenticate(params[:password])
            session[:user_id] = player.id
            redirect '/games'
        end
        redirect '/login'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end