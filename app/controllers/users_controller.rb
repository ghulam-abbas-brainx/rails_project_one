# app/controllers/users_controller.rb

class UsersController < ApplicationController

    def index
        if check_session?
            redirect_to '/jobs'
        end
    end

    def login
        email = params[:email]
        password = params[:password]

        user = User.find_by_email(params[:email])
        if user && password == user.password
            session["id"] = user.id
            redirect_to '/jobs'

        else
            redirect_to '/users/index'
        end

    end

    def destroy
        if session["id"] != nil
            session["id"] = nil
            redirect_to '/users/index'
        end
    end

    private
    def check_session?
        if session["id"] != nil
            return true
        end
        return false
    end

end