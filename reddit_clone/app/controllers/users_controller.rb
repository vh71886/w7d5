class UsersController < ApplicationController

    def index
        @user = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create

    end

    def edit

    end

    def update

    end

    private
    def user_params
        
    end
end
