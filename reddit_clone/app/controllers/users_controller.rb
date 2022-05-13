class UsersController < ApplicationController

    def index
        @users = User.all
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
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
        @user = User.find(params[:id])
        # debugger
        # (user_params[:password] = nil) if (user_params[:password] == "")
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
            # flash.now[:errors] = @user.errors.full_messages
            # render :edit
        end
    end

    # practice, not in routes
    # def destroy
    #     @user = User.find(params[:id])
    #     if @user && @user.delete
    #         redirect_to users_url
    #     else
    #         flash.now[:errors] = @user.errors.full_messages
    #         render :show
    #     end
    # end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
